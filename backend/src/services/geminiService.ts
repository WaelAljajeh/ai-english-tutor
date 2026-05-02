import dotenv from "dotenv";
dotenv.config();

const API_KEY = process.env.GEMINI_API_KEY;

export const generateGeminiResponse = async (systemPrompt, message,history = []) => {
    const formattedHistory = history.map(m => ({
  role: m.role,
  parts: [{ text: m.text }]
}));
  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash-lite:generateContent?key=${API_KEY}`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        contents: [
  {
    role: "user",
    parts: [{ text: systemPrompt }]
  },
  ...formattedHistory,

]
      })
    }
  );

  const data = await response.json();

  const reply = data?.candidates?.[0]?.content?.parts?.[0]?.text;

  return reply || "No response from AI";
};