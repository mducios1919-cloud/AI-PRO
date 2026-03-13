from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
from typing import List
import httpx, os, json

app = FastAPI()

# ✅ CORS - cho phép mọi website gọi vào
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# 🔑 API Key Groq - thay bằng key của bạn
GROQ_API_KEY = os.environ.get("GROQ_API_KEY", "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")
MODEL = "llama-3.1-70b-versatile"

SYSTEM_PROMPT = """Bạn là MindAI - trợ lý AI thông minh miễn phí cho học sinh sinh viên Việt Nam.
Bạn có thể giải thích bài học, viết code, giải toán, viết luận, phân tích dữ liệu và hỗ trợ mọi thứ.
Trả lời bằng tiếng Việt, rõ ràng, đầy đủ và có cấu trúc."""

class Message(BaseModel):
    role: str
    content: str

class ChatRequest(BaseModel):
    messages: List[Message]

@app.get("/")
def root():
    return {"status": "MindAI đang chạy!", "model": MODEL}

@app.post("/chat")
async def chat(req: ChatRequest):
    payload = {
        "model": MODEL,
        "messages": [{"role": "system", "content": SYSTEM_PROMPT}] + [m.dict() for m in req.messages],
        "temperature": 0.7,
        "max_tokens": 4096,
        "stream": True,
    }

    async def generate():
        async with httpx.AsyncClient(timeout=60) as client:
            async with client.stream(
                "POST",
                "https://api.groq.com/openai/v1/chat/completions",
                json=payload,
                headers={"Authorization": f"Bearer {GROQ_API_KEY}"},
            ) as response:
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
                            except:
                                pass

    return StreamingResponse(generate(), media_type="text/event-stream")
