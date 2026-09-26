#!/usr/bin/env bash
# Setzt Beschreibung, Website und Topics fuer alle fuenf oeffentlichen Repos,
# damit GitHub sie in Listen und Suche mit Kurzbeschreibung anzeigt.
#
# Ausfuehren:
#   1. Token holen: https://github.com/settings/tokens?type=beta
#      "Fine-grained token", Repository access: All repositories,
#      Permissions -> Repository -> Administration: Read and write.
#      (Metadata allein ist nur lesend und reicht nicht.)
#   2. export GITHUB_TOKEN=github_pat_...
#   3. bash repos-beschriften.sh
# Braucht curl und jq. Bricht beim ersten HTTP-Fehler mit GitHubs Antwort ab.
set -euo pipefail
: "${GITHUB_TOKEN:?export GITHUB_TOKEN=... zuerst setzen}"
command -v jq >/dev/null || { echo "jq fehlt (z. B. apt install jq)" >&2; exit 1; }

SEITE="https://my-website.abdilkarimb.workers.dev"

api() { # methode url, JSON-Body auf stdin
  local antwort
  if ! antwort=$(curl -sS --fail-with-body -X "$1" "$2" \
      -H "Authorization: Bearer $GITHUB_TOKEN" \
      -H 'Accept: application/vnd.github+json' \
      --data-binary @-); then
    printf 'Fehler bei %s %s:\n%s\n' "$1" "$2" "$antwort" >&2
    exit 1
  fi
}

setze() { # repo beschreibung homepage topics...
  local repo="$1" beschreibung="$2" homepage="$3"; shift 3

  jq -n --arg d "$beschreibung" --arg h "$homepage" '{description: $d, homepage: $h}' |
    api PATCH "https://api.github.com/repos/KarimBk7/$repo"

  jq -n '{names: $ARGS.positional}' --args "$@" |
    api PUT "https://api.github.com/repos/KarimBk7/$repo/topics"

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

setze Kaiju-Adventure \
  "A complete 2D action adventure in Java, built without a game engine - own game loop, rendering, collision detection, tile world and save games." \
  "$SEITE/en/projects/kaiju/" \
  java game-development 2d-game game-loop maven jpackage

setze Wordle-Solver \
  "Filters every still-possible word from a Wordle round's colour hints, out of the game's real word lists. Python with zero dependencies, shipped as a Windows build." \
  "$SEITE/en/projects/wordle/" \
  python tkinter wordle solver pyinstaller no-dependencies

setze Learning-repository \
  "Notes, terminal logs and runnable examples across 30 topics, grown over 17 months alongside FU Berlin's programming practicum. 67/67 assignments accepted." \
  "$SEITE/en/projects/lernrepo/" \
  learning-resources python go sql linux web-development testing

echo "Fertig. Kontrolle: https://github.com/KarimBk7?tab=repositories"
