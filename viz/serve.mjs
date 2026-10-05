import { createServer } from "node:http";
import { readFile, readdir } from "node:fs/promises";
import { join, resolve, sep } from "node:path";

const resultsDir = resolve(process.env.RESULTS_DIR);
const page = join(import.meta.dirname, "index.html");
const port = Number(process.env.PORT ?? 3100);

async function listResults() {
  const files = await readdir(resultsDir, { recursive: true });
  // Timestamped directories, so reverse order puts the newest first
  return files.filter((f) => f.endsWith(".json")).sort().reverse();
}

function send(res, status, type, body) {
  res.writeHead(status, { "Content-Type": type });
  res.end(body);
}

createServer(async (req, res) => {
  const { pathname } = new URL(req.url, "http://localhost");
  try {
    if (pathname === "/") {
      return send(res, 200, "text/html; charset=utf-8", await readFile(page));
    }
    if (pathname === "/results") {
      return send(res, 200, "application/json", JSON.stringify(await listResults()));
    }
    if (pathname.startsWith("/results/")) {
      const file = resolve(resultsDir, decodeURIComponent(pathname.slice("/results/".length)));
      if (file.startsWith(resultsDir + sep) && file.endsWith(".json")) {
        return send(res, 200, "application/json", await readFile(file));
      }
    }
  } catch {
    // Missing or unreadable files fall through to 404
  }
  send(res, 404, "text/plain", "Not found");
}).listen(port, "127.0.0.1", () => console.log(`Skill A/B report: http://localhost:${port}`));
