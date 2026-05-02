import app from "./src/app"
import dotenv from "dotenv";
dotenv.config();
const PORT=Number(process.env.PORT)||3000;
app.listen(PORT, "0.0.0.0", () => {
  console.log("Server running");
});