---
name: skills-orchestrator
description: >-
  Карта всех персональных Cursor-скиллов Абрамова со ссылками на GitHub и
  командами установки. Use when restoring skills after PC wipe, asking which
  skill to use, «оркестратор скиллов», список skills, install from GitHub.
---

# Skills Orchestrator

Единая точка входа: какой скилл брать и откуда ставить после переустановки.

Бэкап на Яндекс.Диске: `/media/keepi/Новый том/Yandex.Disk/Cursor_Backup_2026-08-20/`

## Быстрая установка всех своих скиллов

```powershell
# User-scope в Cursor
gh skill install abramovmarketing88-byte/abramov-telegram-posts --agent cursor --scope user
gh skill install abramovmarketing88-byte/telegram-post-review --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-photos --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-factory --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-search-audit --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-api-skill --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-budget-review --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-listing-audit --agent cursor --scope user
# мета-разбор кабинета (лежит в monorepo orchestrator/skills/):
# скопировать skills/avito-cabinet-orchestrator → ~/.cursor/skills/
# или: git clone abramovmarketing88-byte/orchestrator и взять папку skills/avito-cabinet-orchestrator
gh skill install abramovmarketing88-byte/ai-seller-master --agent cursor --scope user
gh skill install abramovmarketing88-byte/tidy-folder --agent cursor --scope user
gh skill install abramovmarketing88-byte/yadisk-mcp --agent cursor --scope user
gh skill install abramovmarketing88-byte/skill-auditor --agent cursor --scope user
gh skill install abramovmarketing88-byte/create-skill-author --agent cursor --scope user
gh skill install abramovmarketing88-byte/youtube-publish --agent cursor --scope user
gh skill install abramovmarketing88-byte/viral-reels --agent cursor --scope user
gh skill install abramovmarketing88-byte/landing-audit --agent cursor --scope user
gh skill install abramovmarketing88-byte/landing-pipeline --agent cursor --scope user
gh skill install abramovmarketing88-byte/selling-landing --agent cursor --scope user
gh skill install abramovmarketing88-byte/ui-design-review --agent cursor --scope user
gh skill install abramovmarketing88-byte/heygen-avatar --agent cursor --scope user
gh skill install abramovmarketing88-byte/heygen-video --agent cursor --scope user
gh skill install abramovmarketing88-byte/heygen-translate --agent cursor --scope user
gh skill install abramovmarketing88-byte/skills-orchestrator --agent cursor --scope user
gh skill install abramovmarketing88-byte/linear-orchestrator --agent cursor --scope user
# опционально монорепо-пачка (дублирует часть скиллов выше)
gh skill install abramovmarketing88-byte/cursor-skills --agent cursor --scope user --all
```

Альтернатива из бэкапа:

```powershell
robocopy "/media/keepi/Новый том/Yandex.Disk/Cursor_Backup_2026-08-20/skills" "$env:USERPROFILE\.cursor/skills" /E
```

## Каталог

| Скилл | Когда | GitHub |
|-------|--------|--------|
| **abramov-telegram-posts** | Пост с нуля голосом Абрамова / @Abramov_like | https://github.com/abramovmarketing88-byte/abramov-telegram-posts |
| **telegram-post-review** | Полировка готового TG-поста | https://github.com/abramovmarketing88-byte/telegram-post-review |
| **avito-factory** | Полный цикл объявлений Авито → CSV/XLSX | https://github.com/abramovmarketing88-byte/avito-factory |
| **avito-photos** | ImageUrls через Я.Диск, CTR-оверлеи 4:3 | https://github.com/abramovmarketing88-byte/avito-photos |
| **avito-search-audit** | Парсинг выдачи / конкуренты | https://github.com/abramovmarketing88-byte/avito-search-audit |
| **avito-api** | Экспорт/статы через Avito API | https://github.com/abramovmarketing88-byte/avito-api-skill |
| **avito-budget-review** | Разбор бюджета Авито+CRM → HTML/canvas | https://github.com/abramovmarketing88-byte/avito-budget-review |
| **avito-listing-audit** | Аудит карточки объявления Авито | https://github.com/abramovmarketing88-byte/avito-listing-audit |
| **avito-cabinet-orchestrator** | Полный разбор кабинета: API + бюджет + top/anti карточки | https://github.com/abramovmarketing88-byte/orchestrator/tree/main/skills/avito-cabinet-orchestrator |
| **ai-seller-master** | AI-продавец Suvvy/Avito | https://github.com/abramovmarketing88-byte/ai-seller-master |
| **tidy-folder** | Уборка папки без удаления | https://github.com/abramovmarketing88-byte/tidy-folder |
| **yadisk-mcp** | Яндекс Диск через MCP / cloud-api | https://github.com/abramovmarketing88-byte/yadisk-mcp |
| **landing-audit** | Аудит лендинга | https://github.com/abramovmarketing88-byte/landing-audit |
| **landing-pipeline** | JSON-пайплайн лендинга (7 шагов, без фейк-пруфа) | https://github.com/abramovmarketing88-byte/landing-pipeline |
| **ui-design-review** | UI review | https://github.com/abramovmarketing88-byte/ui-design-review |
| **selling-landing** | Продающий лендинг | https://github.com/abramovmarketing88-byte/selling-landing |
| **skills-orchestrator** | Эта карта | https://github.com/abramovmarketing88-byte/skills-orchestrator |
| **linear-orchestrator** | Строго линейный пайплайн 4 агентов (без откатов) | https://github.com/abramovmarketing88-byte/linear-orchestrator |
| **skill-auditor** | Аудит / план / fix / verify чужих Cursor-скиллов | https://github.com/abramovmarketing88-byte/skill-auditor |
| **create-skill-author** | Создать новый Agent Skill (SKILL.md) | https://github.com/abramovmarketing88-byte/create-skill-author |
| **youtube-publish** | Пакет публикации YouTube + RuTube (описание, Studio) | https://github.com/abramovmarketing88-byte/youtube-publish |
| **viral-reels** | Сценарии виральных Reels / Shorts / TikTok (режиссёрская таблица) | https://github.com/abramovmarketing88-byte/viral-reels |
| **heygen-avatar** | HeyGen аватар / digital twin | https://github.com/abramovmarketing88-byte/heygen-avatar |
| **heygen-video** | HeyGen генерация видео | https://github.com/abramovmarketing88-byte/heygen-video |
| **heygen-translate** | HeyGen перевод / дубляж | https://github.com/abramovmarketing88-byte/heygen-translate |

Монорепо пачки (частичный дубль): https://github.com/abramovmarketing88-byte/cursor-skills

OpenClaw/Cursor orchestrator monorepo (в т.ч. `avito-cabinet-orchestrator`): https://github.com/abramovmarketing88-byte/orchestrator

## HeyGen

Свои копии скиллов на GitHub (см. каталог). Обычно также ставятся через Cursor plugin **heygen**.

MCP HeyGen: remote `https://mcp.heygen.com/mcp/v1/`

## MCP рядом со скиллами

| MCP | Репо / источник |
|-----|-----------------|
| telegram | https://github.com/abramovmarketing88-byte/telegram-bot-mcp |
| yadisk | локально `~/.cursor/mcp-servers/yadisk/` + скилл `yadisk-mcp` |
| threejs-devtools | `npx -y threejs-devtools-mcp` |
| heygen | remote MCP + OAuth |

Полный restore: `/media/keepi/Новый том/Yandex.Disk/Cursor_Backup_2026-08-20/restore\RESTORE.md`

## Маршрутизация запросов

1. «Напиши пост» → `abramov-telegram-posts` → потом `telegram-post-review`
2. «Объявления / автозагрузка / CSV» → `avito-factory` (+ `avito-photos` для фото)
3. «Выдача / конкуренты» → `avito-search-audit`
4. «Выгрузка API / статистика» → `avito-api`
4a. «Разбор бюджета / куда ушёл бюджет / Авито+CRM» → `avito-budget-review`
4b. «Аудит карточки объявления» → `avito-listing-audit`
4c. «Разбор кабинета по API / top anti-top» → `avito-cabinet-orchestrator` (см. [avito-cabinet.md](./avito-cabinet.md)); сабскиллы: `avito-api` + `avito-budget-review` + `avito-listing-audit`
5. «Бот-продавец / Suvvy» → `ai-seller-master`
6. «Прибери папку» → `tidy-folder`
6a. «Яндекс Диск / yadisk / загрузить на Диск» → `yadisk-mcp`
7. «Видео / аватар HeyGen» → heygen-* + MCP heygen
7a. «Пакет YouTube / RuTube / описание ролика / Studio» → `youtube-publish`
7b. «Сценарий рилса / Shorts / TikTok / хук / вертикальное видео» → `viral-reels` (не heygen-video и не youtube-publish)
8. «Что за скиллы / поставь всё» → этот оркестратор
9. «Линейный оркестратор / MASTER ORCHESTRATOR / Task_Input» → `linear-orchestrator`
10. «Лендинг JSON-пайплайн / системный оркестратор / quality-gate / gpts-landing-orchestrator» → `landing-pipeline` (потом `selling-landing` на вёрстку)
11. «Лендинг / one-pager / LP / тексты блоков / HTML» → `selling-landing`
12. «Аудит / докрутить готовый лендинг» → `landing-audit`
13. «Аудит навыка / проверить скилл / skill-auditor» → `skill-auditor` (не путать с `landing-audit`)
14. «Создать скилл / написать SKILL.md» → `create-skill-author`
