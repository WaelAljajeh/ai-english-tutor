export class AppError extends Error {
  statusCode: number;
  constructor(message, statusCode) {
    super(message);

    this.name = "AppError";
    this.statusCode = statusCode;
    Error.captureStackTrace(this, this.constructor);
  }
}
export const errorHandler = (err, req, res, next) => {
  console.error("🔥 ERROR STACK:");
  console.error(err.stack || err);

  const statusCode = err.statusCode || 500;
  const message = err.message || "Internal Server Error";

  const errorResponse = {
    success: false,
    status: statusCode,
    message,
    timestamp: new Date().toISOString(),
  };

  // show stack only in development
 

  res.status(statusCode).json(errorResponse);
};