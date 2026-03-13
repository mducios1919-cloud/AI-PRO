from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
from typing import List, Optional
import httpx
import os
import json

app = FastAPI(title="AI Backend - Học Sinh Sinh Viên VN")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

GROQ_API_KEY = os.environ.get("GROQ_API_KEY")
MODEL = "llama-3.1-70b-versatile"
GROQ_URL = "https://api.groq.com/openai/v1/chat/completions"

SYSTEM_PROMPT = """Bạn là một trợ lý AI thông minh, thân thiện, hỗ trợ học sinh và sinh viên Việt Nam.
Bạn có thể:
- Giải thích khái niệm học thuật rõ ràng, dễ hiểu
- Viết và giải thích code (Python, JS, C++, Java, v.v.)
- Phân tích dữ liệu và toán học
- Hỗ trợ viết luận, báo cáo
- Trả lời mọi câu hỏi không giới hạn chủ đề
Luôn trả lời bằng tiếng Việt trừ khi người dùng hỏi bằng tiếng khác.
Trả lời chính xác, đầy đủ, và có cấu trúc rõ ràng."""


class Message(BaseModel):
    role: str
    content: str


class ChatRequest(BaseModel):
    messages: List[Message]
    stream: Optional[bool] = False


@app.get("/")
def root():
    return {"status": "AI Backend đang chạy!", "model": MODEL}


@app.post("/chat")
async def chat(req: ChatRequest):
    if not GROQ_API_KEY:
        raise HTTPException(500, "GROQ_API_KEY chưa được cấu hình")

    payload = {
        "model": MODEL,
        "messages": [{"role": "system", "content": SYSTEM_PROMPT}]
        + [m.dict() for m in req.messages],
        "temperature": 0.7,
        "max_tokens": 4096,
        "stream": False,
    }

    async with httpx.AsyncClient(timeout=60) as client:
        response = await client.post(
            GROQ_URL,
            json=payload,
            headers={"Authorization": f"Bearer {GROQ_API_KEY}"},
        )
        if response.status_code != 200:
            raise HTTPException(response.status_code, response.text)

        data = response.json()
        reply = data["choices"][0]["message"]["content"]
        return {"reply": reply, "model": MODEL, "tokens": data.get("usage")}


@app.post("/chat/stream")
async def chat_stream(req: ChatRequest):
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
                "POST",
                GROQ_URL,
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
                            except Exception:
                                pass

    return StreamingResponse(generate(), media_type="text/event-stream")
