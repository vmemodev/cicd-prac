import express from "express";
import type { Request, Response } from "express";

const app = express();
const port = Number(process.env.PORT ?? 3000);

app.get("/", (_req: Request, res: Response) => {
  const now = new Date().toISOString();
  res.status(200).json({
    status: "ok!",
    message: "Hello World! v1.0",
    currentTime: now,
  });
});

app.get("/health", (_req, res) => {
  res.status(200).send("OK");
});

app.listen(port, "0.0.0.0", () => {
  console.log(`Server is started : http://0.0.0.0:${port}`);
});
