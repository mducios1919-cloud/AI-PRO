# 🧠 MindAI — Trợ Lý Học Tập Miễn Phí

AI miễn phí cho học sinh và sinh viên Việt Nam, sử dụng LLaMA 3.1 70B qua Groq.

---

## 📁 Cấu trúc project

```
ai-project/
├── backend-node/       ← Backend Node.js (Express)
│   ├── server.js
│   └── package.json
├── backend-python/     ← Backend Python (FastAPI)
│   ├── main.py
│   ├── requirements.txt
│   └── Procfile
└── frontend/           ← Giao diện web
    └── index.html
```

---

## 🔑 BƯỚC 1: Lấy Groq API Key (MIỄN PHÍ)

1. Vào https://console.groq.com
2. Đăng ký tài khoản (miễn phí)
3. Vào **API Keys** → **Create API Key**
4. Copy key dạng: `gsk_xxxxxxxxxxxxxxxxxxxx`

---

## 🚀 BƯỚC 2: Deploy Backend

### Option A: Render.com (Khuyến nghị)

#### Deploy Node.js:
1. Push folder `backend-node` lên GitHub
2. Vào https://render.com → New → Web Service
3. Connect GitHub repo
4. Cấu hình:
   - **Build Command:** `npm install`
   - **Start Command:** `node server.js`
   - **Environment Variables:** `GROQ_API_KEY = gsk_xxxxx`
5. Deploy → Copy URL dạng: `https://your-app.onrender.com`

#### Deploy Python:
1. Push folder `backend-python` lên GitHub
2. Vào Render → New → Web Service
3. Cấu hình:
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `uvicorn main:app --host 0.0.0.0 --port $PORT`
   - **Environment Variables:** `GROQ_API_KEY = gsk_xxxxx`

### Option B: Railway.app

1. Push code lên GitHub
2. Vào https://railway.app → New Project → Deploy from GitHub
3. Add variable: `GROQ_API_KEY = gsk_xxxxx`
4. Railway tự detect và deploy

---

## 🌐 BƯỚC 3: Deploy Frontend

### GitHub Pages (miễn phí, dễ nhất):
1. Tạo repo mới trên GitHub
2. Upload file `frontend/index.html` → đổi tên thành `index.html`
3. Vào Settings → Pages → Source: main branch
4. Website của bạn: `https://username.github.io/repo-name`

### Netlify (kéo thả):
1. Vào https://netlify.com
2. Kéo thả folder `frontend` vào
3. Done!

---

## ⚙️ BƯỚC 4: Cấu hình Frontend

Khi vào website:
1. Nhập **Groq API Key** vào ô API KEY
2. Chọn hoặc nhập **Server URL** (URL từ Render/Railway)
3. Bấm **LƯU**
4. Bắt đầu chat!

---

## 🔧 Chạy local (test trước khi deploy)

### Node.js:
```bash
cd backend-node
npm install
GROQ_API_KEY=gsk_xxx node server.js
# Server chạy tại http://localhost:3000
```

### Python:
```bash
cd backend-python
pip install -r requirements.txt
GROQ_API_KEY=gsk_xxx uvicorn main:app --reload
# Server chạy tại http://localhost:8000
```

Sau đó mở `frontend/index.html` bằng trình duyệt.

---

## 📊 Giới hạn Groq Free Tier

| Model | Tokens/phút | Requests/phút | Requests/ngày |
|-------|------------|---------------|---------------|
| LLaMA 3.1 70B | 6,000 | 30 | 1,000 |
| LLaMA 3.1 8B | 20,000 | 30 | 14,400 |

→ Đủ dùng cho nhiều học sinh cùng lúc!

---

## 🛠️ Tính năng

- ✅ Chat AI thông minh (LLaMA 3.1 70B)
- ✅ Streaming response (chữ hiện từng chữ)
- ✅ Highlight code syntax
- ✅ Copy code 1 click
- ✅ Render Markdown (bảng, list, heading...)
- ✅ Lịch sử hội thoại (multi-turn)
- ✅ Responsive mobile
- ✅ Lưu config localStorage

---

## 💡 Tips

- Có thể đổi `SYSTEM_PROMPT` trong server để customize AI theo ý
- Đổi `MODEL` sang `llama-3.1-8b-instant` để nhanh hơn (nhưng kém hơn)
- Có thể host nhiều backend và switch URL trong frontend
