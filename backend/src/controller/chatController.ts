import { AppError } from "../middleware/errorHandler";
import { generateGeminiResponse } from "../services/geminiService";
import { aiMemory } from "./memoryController";

const systemPrompt = `
You are an English conversation tutor.

Rules:
- Keep replies short and natural
- Correct grammar politely
- Show correction + explanation
- Ask follow-up questions
`;

export const chatWithAI = async (req, res) => {
  try {
    const { message, userId = "default_user" } = req.body;

    if (!message) {
      throw new AppError("Message is Required", 400);
    }

    // 1. store user message + get history
    const history = aiMemory(message, userId, "user");

    // 2. send to AI
    const reply = await generateGeminiResponse(
      systemPrompt,
      message,
      history
    );

    // 3. store AI reply (IMPORTANT)
    aiMemory(reply, userId, "model");

    res.json({ reply });

  } catch (err) {
    console.error(err);
    res.status(err.statusCode || 500).json({
      error: err.message || "Server error"
    });
  }
};