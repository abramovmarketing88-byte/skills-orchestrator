---
name: skills-orchestrator
description: >-
  Карта всех персональных Cursor-скиллов Абрамова со ссылками на GitHub и
  командами установки. Use when restoring skills after PC wipe, asking which
  skill to use, «оркестратор скиллов», список skills, install from GitHub.
---

# Skills Orchestrator

Единая точка входа: какой скилл брать и откуда ставить после переустановки.

Бэкап на Яндекс.Диске: `D:\Yandex.Disk\Cursor_Backup_2026-08-20\`

## Быстрая установка всех своих скиллов

```powershell
# User-scope в Cursor
gh skill install abramovmarketing88-byte/abramov-telegram-posts --agent cursor --scope user
gh skill install abramovmarketing88-byte/telegram-post-review --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-photos --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-factory --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-search-audit --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-api-skill --agent cursor --scope user
gh skill install abramovmarketing88-byte/tidy-folder --agent cursor --scope user
gh skill install abramovmarketing88-byte/cursor-skills --agent cursor --scope user --all
gh skill install abramovmarketing88-byte/skills-orchestrator --agent cursor --scope user
```

Альтернатива из бэкапа:

```powershell
robocopy "D:\Yandex.Disk\Cursor_Backup_2026-08-20\skills" "$env:USERPROFILE\.cursor\skills" /E
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
| **ai-seller-master** | AI-продавец Suvvy/Avito | https://github.com/abramovmarketing88-byte/cursor-skills/tree/main/ai-seller-master |
| **tidy-folder** | Уборка папки без удаления | https://github.com/abramovmarketing88-byte/tidy-folder |
| **landing-audit** | Аудит лендинга | https://github.com/abramovmarketing88-byte/cursor-skills/tree/main/landing-audit |
| **ui-design-review** | UI review | https://github.com/abramovmarketing88-byte/cursor-skills/tree/main/ui-design-review |
| **selling-landing** | Продающий лендинг | https://github.com/abramovmarketing88-byte/cursor-skills/tree/main/selling-landing |
| **skills-orchestrator** | Эта карта | https://github.com/abramovmarketing88-byte/skills-orchestrator |

Монорепо пачки: https://github.com/abramovmarketing88-byte/cursor-skills

## HeyGen (плагин Cursor, не наш репозиторий)

Локальные копии в бэкапе `skills/heygen-*`. Обычно ставятся через Cursor plugin **heygen**:

- `heygen-avatar` — создать аватар / digital twin
- `heygen-video` — сгенерировать видео
- `heygen-translate` — перевод/дубляж

MCP HeyGen: remote `https://mcp.heygen.com/mcp/v1/`

## MCP рядом со скиллами

| MCP | Репо / источник |
|-----|-----------------|
| telegram | https://github.com/abramovmarketing88-byte/telegram-bot-mcp |
| threejs-devtools | `npx -y threejs-devtools-mcp` |
| heygen | remote MCP + OAuth |

Полный restore: `D:\Yandex.Disk\Cursor_Backup_2026-08-20\restore\RESTORE.md`

## Маршрутизация запросов

1. «Напиши пост» → `abramov-telegram-posts` → потом `telegram-post-review`
2. «Объявления / автозагрузка / CSV» → `avito-factory` (+ `avito-photos` для фото)
3. «Выдача / конкуренты» → `avito-search-audit`
4. «Выгрузка API / статистика» → `avito-api`
5. «Бот-продавец / Suvvy» → `ai-seller-master`
6. «Прибери папку» → `tidy-folder`
7. «Видео / аватар HeyGen» → heygen-* + MCP heygen
8. «Что за скиллы / поставь всё» → этот оркестратор
