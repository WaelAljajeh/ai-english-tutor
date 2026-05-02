import express from "express";
import cors from "cors";
import chatRoutes from "./routes/chatRoutes";
import { errorHandler } from "./middleware/errorHandler";

const app = express();

app.use(cors());
app.use(express.json());

// routes
app.use("/api/chat", chatRoutes);

// error handler MUST be last
app.use(errorHandler);

export default app;