from fastapi import FastAPI, HTTPException, Depends, Header
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
from typing import List, Optional
import httpx, os, json

app = FastAPI(title="MindAI Backend")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# ══════════════════════════════════════════
# ⚙️  SỬA 3 DÒNG NÀY
GROQ_API_KEY  = os.environ.get("GROQ_API_KEY", "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")
SB_URL        = os.environ.get("SUPABASE_URL", "https://hsrkselmbmejucnntmad.supabase.co")   # https://xxx.supabase.co
SB_KEY        = os.environ.get("SUPABASE_KEY", "sb_publishable_HnopjWGAywL4hk-tpdO6rw_szSophZ0")   # service_role key
# ══════════════════════════════════════════

MODEL = "llama-3.1-70b-versatile"
GROQ_URL = "https://api.groq.com/openai/v1/chat/completions"

SYSTEM_PROMPT = """Bạn là MindAI - trợ lý AI thông minh miễn phí cho học sinh và sinh viên Việt Nam.
Bạn có thể:
- Giải thích bài học, khái niệm học thuật rõ ràng, dễ hiểu
- Viết và giải thích code (Python, JS, C++, Java, v.v.)
- Giải toán, phân tích dữ liệu
- Hỗ trợ viết luận, báo cáo, tiểu luận
- Trả lời mọi câu hỏi không giới hạn chủ đề
Luôn trả lời bằng tiếng Việt trừ khi người dùng hỏi bằng tiếng khác.
Trả lời chính xác, đầy đủ, có cấu trúc rõ ràng."""


# ── MODELS ────────────────────────────────
class Message(BaseModel):
    role: str
    content: str

class ChatRequest(BaseModel):
    messages: List[Message]

class RegisterRequest(BaseModel):
    email: str
    password: str
    full_name: Optional[str] = ""

class LoginRequest(BaseModel):
    email: str
    password: str

class SaveMessageRequest(BaseModel):
    session_id: str
    role: str
    content: str

class CreateSessionRequest(BaseModel):
    title: str

class UserToken(BaseModel):
    access_token: str
    user_id: str


# ── HELPERS ───────────────────────────────
async def get_supabase_user(authorization: str = Header(None)):
    """Xác thực user qua Supabase JWT token"""
    if not authorization or not authorization.startswith("Bearer "):
        raise HTTPException(401, "Thiếu token xác thực")
    token = authorization.split(" ")[1]
    async with httpx.AsyncClient() as client:
        res = await client.get(
            f"{SB_URL}/auth/v1/user",
            headers={"Authorization": f"Bearer {token}", "apikey": SB_KEY}
        )
        if res.status_code != 200:
            raise HTTPException(401, "Token không hợp lệ hoặc đã hết hạn")
        return res.json()


# ══════════════════════════════════════════
# AUTH ENDPOINTS
# ══════════════════════════════════════════

@app.post("/auth/register")
async def register(req: RegisterRequest):
    """Đăng ký tài khoản mới"""
    if not req.email or not req.password:
        raise HTTPException(400, "Email và mật khẩu không được để trống")
    if len(req.password) < 6:
        raise HTTPException(400, "Mật khẩu tối thiểu 6 ký tự")

    async with httpx.AsyncClient() as client:
        res = await client.post(
            f"{SB_URL}/auth/v1/signup",
            headers={"apikey": SB_KEY, "Content-Type": "application/json"},
            json={
               "email": req.email,
    "password": req.password,
    "data": {"full_name": req.full_name},
    "email_confirm": True  # ← thêm dòng này
            }
        )
        data = res.json()
        if res.status_code != 200:
            msg = data.get("msg") or data.get("error_description") or data.get("message") or "Đăng ký thất bại"
            raise HTTPException(400, msg)
        return {"message": "Đăng ký thành công! Hãy đăng nhập.", "email": req.email}


@app.post("/auth/login")
async def login(req: LoginRequest):
    """Đăng nhập"""
    async with httpx.AsyncClient() as client:
        res = await client.post(
            f"{SB_URL}/auth/v1/token?grant_type=password",
            headers={"apikey": SB_KEY, "Content-Type": "application/json"},
            json={"email": req.email, "password": req.password}
        )
        data = res.json()
        if res.status_code != 200:
            msg = data.get("error_description") or data.get("msg") or "Email hoặc mật khẩu không đúng"
            raise HTTPException(401, msg)
        return {
            "access_token": data["access_token"],
            "refresh_token": data["refresh_token"],
            "user": {
                "id": data["user"]["id"],
                "email": data["user"]["email"],
                "full_name": data["user"].get("user_metadata", {}).get("full_name", "")
            }
        }


@app.post("/auth/logout")
async def logout(user=Depends(get_supabase_user), authorization: str = Header(None)):
    """Đăng xuất"""
    token = authorization.split(" ")[1]
    async with httpx.AsyncClient() as client:
        await client.post(
            f"{SB_URL}/auth/v1/logout",
            headers={"Authorization": f"Bearer {token}", "apikey": SB_KEY}
        )
    return {"message": "Đã đăng xuất"}


@app.get("/auth/me")
async def me(user=Depends(get_supabase_user)):
    """Lấy thông tin user hiện tại"""
    return {
        "id": user["id"],
        "email": user["email"],
        "full_name": user.get("user_metadata", {}).get("full_name", "")
    }


# ══════════════════════════════════════════
# CHAT SESSIONS ENDPOINTS
# ══════════════════════════════════════════

@app.get("/sessions")
async def get_sessions(user=Depends(get_supabase_user)):
    """Lấy danh sách hội thoại của user"""
    async with httpx.AsyncClient() as client:
        res = await client.get(
            f"{SB_URL}/rest/v1/chat_sessions?user_id=eq.{user['id']}&order=updated_at.desc&limit=50",
            headers={"apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}"}
        )
        return res.json()


@app.post("/sessions")
async def create_session(req: CreateSessionRequest, user=Depends(get_supabase_user)):
    """Tạo hội thoại mới"""
    async with httpx.AsyncClient() as client:
        res = await client.post(
            f"{SB_URL}/rest/v1/chat_sessions",
            headers={
                "apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}",
                "Content-Type": "application/json", "Prefer": "return=representation"
            },
            json={"user_id": user["id"], "title": req.title}
        )
        data = res.json()
        return data[0] if isinstance(data, list) else data


@app.delete("/sessions/{session_id}")
async def delete_session(session_id: str, user=Depends(get_supabase_user)):
    """Xóa hội thoại"""
    async with httpx.AsyncClient() as client:
        # Xóa messages trước
        await client.delete(
            f"{SB_URL}/rest/v1/chat_messages?session_id=eq.{session_id}",
            headers={"apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}"}
        )
        # Xóa session
        await client.delete(
            f"{SB_URL}/rest/v1/chat_sessions?id=eq.{session_id}&user_id=eq.{user['id']}",
            headers={"apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}"}
        )
    return {"message": "Đã xóa"}


# ══════════════════════════════════════════
# CHAT MESSAGES ENDPOINTS
# ══════════════════════════════════════════

@app.get("/sessions/{session_id}/messages")
async def get_messages(session_id: str, user=Depends(get_supabase_user)):
    """Lấy tin nhắn trong một hội thoại"""
    async with httpx.AsyncClient() as client:
        res = await client.get(
            f"{SB_URL}/rest/v1/chat_messages?session_id=eq.{session_id}&order=created_at.asc",
            headers={"apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}"}
        )
        return res.json()


@app.post("/sessions/{session_id}/messages")
async def save_message(session_id: str, req: SaveMessageRequest, user=Depends(get_supabase_user)):
    """Lưu tin nhắn"""
    async with httpx.AsyncClient() as client:
        res = await client.post(
            f"{SB_URL}/rest/v1/chat_messages",
            headers={
                "apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}",
                "Content-Type": "application/json", "Prefer": "return=representation"
            },
            json={"session_id": session_id, "role": req.role, "content": req.content}
        )
        # Cập nhật updated_at của session
        await client.patch(
            f"{SB_URL}/rest/v1/chat_sessions?id=eq.{session_id}",
            headers={"apikey": SB_KEY, "Authorization": f"Bearer {SB_KEY}", "Content-Type": "application/json"},
            json={"updated_at": "now()"}
        )
        return {"message": "Đã lưu"}


# ══════════════════════════════════════════
# AI CHAT ENDPOINT
# ══════════════════════════════════════════

@app.post("/chat")
async def chat(req: ChatRequest):
    """Chat với AI — stream response"""
    if not GROQ_API_KEY:
        raise HTTPException(500, "GROQ_API_KEY chưa được cấu hình")

    payload = {
        "model": MODEL,
        "messages": [{"role": "system", "content": SYSTEM_PROMPT}]
                   + [m.dict() for m in req.messages],
        "temperature": 0.7,
        "max_tokens": 4096,
        "stream": True,
    }

    async def generate():
        async with httpx.AsyncClient(timeout=60) as client:
            async with client.stream(
                "POST", GROQ_URL,
                json=payload,
                headers={"Authorization": f"Bearer {GROQ_API_KEY}"}
            ) as response:
                if response.status_code != 200:
                    body = await response.aread()
                    yield f"data: {json.dumps({'error': body.decode()})}\n\n"
                    return
                async for line in response.aiter_lines():
                    if line.startswith("data: "):
                        data = line[6:]
                        if data == "[DONE]":
                            yield "data: [DONE]\n\n"
                        else:
                            try:
                                parsed = json.loads(data)
                                delta = parsed["choices"][0].get("delta", {}).get("content", "")
                                if delta:
                                    yield f"data: {json.dumps({'delta': delta})}\n\n"
                            except Exception:
                                pass

    return StreamingResponse(generate(), media_type="text/event-stream")


# ══════════════════════════════════════════
# HEALTH CHECK
# ══════════════════════════════════════════

@app.get("/")
def root():
    return {
        "status": "MindAI đang chạy!",
        "model": MODEL,
        "endpoints": ["/auth/register", "/auth/login", "/auth/me", "/chat", "/sessions"]
    }
