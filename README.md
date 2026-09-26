# Abdil Karim Bakir

Computer science student at FU Berlin. Backend at the core, plus web, cloud infrastructure and hardware.
Currently looking for a **part-time working-student position in Berlin or remote** — available immediately.

[Portfolio](https://my-website.abdilkarimb.workers.dev/) ·
[Portfolio as PDF](https://my-website.abdilkarimb.workers.dev/dokumente/project-portfolio-abdil-karim-bakir.pdf) ·
[CV](https://my-website.abdilkarimb.workers.dev/dokumente/cv-abdil-karim-bakir.pdf) ·
[abdilkarimb@gmail.com](mailto:abdilkarimb@gmail.com)

---

## Projects

Every figure below is measured, not estimated — each project sheet on the portfolio site shows how.

| Project | What it is | Scope in numbers |
| --- | --- | --- |
| **Expense configurator for Projektron BCS** — [project sheet](https://my-website.abdilkarimb.workers.dev/en/projects/spesenkonfigurator/) *(client code, not public)* | JavaFX desktop application for a Berlin software company, as backend architect in a team of six: the table core with its frozen column, multi-tab editing with fully isolated state per file, CSV import and export, undo/redo, runtime language switch, crash recovery — and the performance work after the 10,000-row stress test. | 368 of 703 commits mine, 90+ classes, 19 test classes; validation 34× faster at 10,000 rows |
| [**ReflowTask**](https://github.com/KarimBk7/ReflowTask) | Self-hosted task planner that repairs its own schedule: tasks become real time blocks, a missed block is replanned automatically. Spring Boot + React, running on a Raspberry Pi 5. | 168 backend + 29 frontend tests, green in CI; 7 Flyway migrations; multi-user isolation tested adversarially |
| [**Kaiju Adventure**](https://github.com/KarimBk7/Kaiju-Adventure) | A complete 2D action adventure in Java, built **without a game engine**: own game loop, rendering, collision detection, tile world and save games. | 80 × 80 tile world (6,400 tiles), 11 game states, ~4,960 lines of Java |
| [**This portfolio site**](https://github.com/KarimBk7/My-Website) | Bilingual static site on a Cloudflare Worker. No framework in the browser, no cookies, no trackers — and its own Playwright + axe check suite running in CI. | 145 ms response time (median of five requests), ~5 KB of JavaScript per page, WCAG 2.1 AA enforced on every push |
| [**Wordle Solver**](https://github.com/KarimBk7/Wordle-Solver) | Filters every still-possible word from a round's colour hints, out of the game's real word lists. Python, zero dependencies, shipped as a Windows build. | 14,855 words checked in ~2 ms per run |
| [**Learning repository**](https://github.com/KarimBk7/Learning-repository) | Notes, terminal logs and runnable examples across 30 topics, grown over 17 months next to FU Berlin's programming practicum. | 67 / 67 assignments accepted |

## Stack

- **Backend** — Java · Spring Boot · JavaFX · Python · Go · SQL / PostgreSQL
- **Web** — TypeScript · React · Astro · HTML / CSS
- **Infrastructure** — Docker · Linux · Nginx / Caddy · Cloudflare Workers · GitHub Actions · Raspberry Pi
- **Testing** — JUnit 5 · pytest · Vitest · Playwright · TestFX · axe

## How I work

- I measure before and after, and I keep the numbers. Every claim above is backed by a run I can reproduce.
- Tests belong to the feature, not to a later cleanup sprint.
- I write down what I would build differently today — every project sheet on my site has that section.
