import express from "express";
import { chatWithAI } from "../controller/chatController";
const router=express.Router();
router.post("/",chatWithAI)
export default router;