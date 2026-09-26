#!/usr/bin/env bash
# Setzt Beschreibung, Website und Topics fuer alle fuenf oeffentlichen Repos.
# Ohne diese Felder zeigt GitHub auf dem Profil nur den Repo-Namen und eine
# leere Zeile -- das ist der Grund, warum das Profil leer aussieht.
#
# Einmal ausfuehren, dann ist es erledigt:
#   1. Token holen: https://github.com/settings/tokens?type=beta
#      "Fine-grained token", Repository access: All repositories,
#      Permissions -> Repository -> Metadata: Read and write.
#   2. export GITHUB_TOKEN=github_pat_...
#   3. bash repos-beschriften.sh
set -euo pipefail
: "${GITHUB_TOKEN:?export GITHUB_TOKEN=... zuerst setzen}"

SEITE="https://my-website.abdilkarimb.workers.dev"

setze() { # repo beschreibung homepage topics...
  local repo="$1" beschreibung="$2" homepage="$3"; shift 3
  local topics; topics=$(printf '"%s",' "$@"); topics="[${topics%,}]"

  curl -sS -X PATCH "https://api.github.com/repos/KarimBk7/$repo" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H 'Accept: application/vnd.github+json' \
    -d "{\"description\":\"$beschreibung\",\"homepage\":\"$homepage\"}" >/dev/null

  curl -sS -X PUT "https://api.github.com/repos/KarimBk7/$repo/topics" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H 'Accept: application/vnd.github+json' \
    -d "{\"names\":$topics}" >/dev/null

  echo "  $repo"
}

echo "Beschrifte:"

setze ReflowTask \
  "Self-hosted task planner that repairs its own schedule: tasks become real time blocks, missed blocks are replanned automatically. Spring Boot + React, running on a Raspberry Pi 5." \
  "$SEITE/en/projects/reflowtask/" \
  java spring-boot react typescript postgresql docker self-hosted task-management scheduling raspberry-pi

setze My-Website \
  "Bilingual application portfolio: static Astro site on a Cloudflare Worker, no framework in the browser, with its own Playwright and axe check suite in CI." \
  "$SEITE/" \
  astro typescript cloudflare-workers playwright accessibility wcag static-site portfolio

setze Little-Adventure \
  "Kaiju Adventure: a complete 2D action adventure in Java, built without a game engine - own game loop, rendering, collision detection, tile world and save games." \
  "$SEITE/en/projects/kaiju/" \
  java game-development 2d-game game-loop maven jpackage

setze Wordle-Solver \
  "Filters every still-possible word from a Wordle round's colour hints, out of the game's real word lists. Python with zero dependencies, shipped as a Windows build." \
  "$SEITE/en/projects/wordle/" \
  python tkinter wordle solver pyinstaller no-dependencies

setze -propra-Lern-Repository \
  "Notes, terminal logs and runnable examples across 30 topics, grown over 17 months alongside FU Berlin's programming practicum. 67/67 assignments accepted." \
  "$SEITE/en/projects/lernrepo/" \
  learning-resources python go sql linux web-development testing

echo "Fertig. Kontrolle: https://github.com/KarimBk7?tab=repositories"
