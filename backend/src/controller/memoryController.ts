const memory = {};

export const aiMemory = (message, userId, role = "user") => {
  if (!memory[userId]) {
    memory[userId] = [];
  }

  memory[userId].push({
    role,
    text: message,
    timestamp: Date.now()
  });

  return memory[userId];
  
};