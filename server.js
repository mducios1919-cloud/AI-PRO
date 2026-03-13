const express = require("express");
const cors = require("cors");
const fetch = (...args) =>
  import("node-fetch").then(({ default: f }) => f(...args));

const app = express();
app.use(cors());
app.use(express.json());

const GROQ_API_KEY = process.env.GROQ_API_KEY;
const MODEL = "llama-3.1-70b-versatile";

const SYSTEM_PROMPT = `Bạn là một trợ lý AI thông minh, thân thiện, hỗ trợ học sinh và sinh viên Việt Nam.
Bạn có thể:
- Giải thích khái niệm học thuật rõ ràng, dễ hiểu
- Viết và giải thích code (Python, JS, C++, Java, v.v.)
- Phân tích dữ liệu và toán học
- Hỗ trợ viết luận, báo cáo
- Trả lời mọi câu hỏi không giới hạn chủ đề
Luôn trả lời bằng tiếng Việt trừ khi người dùng hỏi bằng tiếng khác.
Trả lời chính xác, đầy đủ, và có cấu trúc rõ ràng.`;

app.get("/", (req, res) => {
  res.json({ status: "AI Backend đang chạy!", model: MODEL });
});

app.post("/chat", async (req, res) => {
  const { messages } = req.body;
  if (!messages || !Array.isArray(messages)) {
    return res.status(400).json({ error: "messages array required" });
  }

  try {
    const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${GROQ_API_KEY}`,
      },
      body: JSON.stringify({
        model: MODEL,
        messages: [{ role: "system", content: SYSTEM_PROMPT }, ...messages],
        temperature: 0.7,
        max_tokens: 4096,
        stream: false,
      }),
    });

    if (!response.ok) {
      const err = await response.text();
      return res.status(response.status).json({ error: err });
    }

    const data = await response.json();
    const reply = data.choices[0].message.content;
    res.json({ reply, model: MODEL, tokens: data.usage });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Server lỗi: " + err.message });
  }
});

// Stream endpoint
app.post("/chat/stream", async (req, res) => {
  const { messages } = req.body;
  res.setHeader("Content-Type", "text/event-stream");
  res.setHeader("Cache-Control", "no-cache");
  res.setHeader("Connection", "keep-alive");

  try {
    const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${GROQ_API_KEY}`,
      },
      body: JSON.stringify({
        model: MODEL,
        messages: [{ role: "system", content: SYSTEM_PROMPT }, ...messages],
        temperature: 0.7,
        max_tokens: 4096,
        stream: true,
      }),
    });

    for await (const chunk of response.body) {
      const lines = chunk.toString().split("\n").filter((l) => l.trim());
      for (const line of lines) {
        if (line.startsWith("data: ")) {
          const data = line.slice(6);
          if (data === "[DONE]") {
            res.write("data: [DONE]\n\n");
          } else {
            try {
              const parsed = JSON.parse(data);
              const delta = parsed.choices[0]?.delta?.content || "";
              if (delta) res.write(`data: ${JSON.stringify({ delta })}\n\n`);
            } catch {}
          }
        }
      }
    }
    res.end();
  } catch (err) {
    res.write(`data: ${JSON.stringify({ error: err.message })}\n\n`);
    res.end();
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server chạy tại port ${PORT}`));
