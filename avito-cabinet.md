# Разбор кабинета Авито

Точка входа — мета-скилл **`avito-cabinet-orchestrator`**.

Он по опроснику запускает связку:

1. `avito-api` — выгрузка кабинета / фида / статистики  
   https://github.com/abramovmarketing88-byte/avito-api-skill
2. `avito-budget-review` — куда ушёл бюджет, тиры, winners/burners  
   https://github.com/abramovmarketing88-byte/avito-budget-review
3. Top-10 / anti-top-10 + diff (режимы `stats_only` | `hybrid` | `full20`) на механике  
   `avito-listing-audit` — https://github.com/abramovmarketing88-byte/avito-listing-audit

Ключи кабинета — только в `avito_export/.env.local`, не в чат. Один набор ключей = один аккаунт.

## Где лежит скилл

- Локально: `~/.cursor/skills/avito-cabinet-orchestrator/`
- GitHub: https://github.com/abramovmarketing88-byte/orchestrator/tree/main/skills/avito-cabinet-orchestrator

## Поставить зависимости

```bash
gh skill install abramovmarketing88-byte/avito-api-skill --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-budget-review --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-listing-audit --agent cursor --scope user
# мета-скилл: скопировать из orchestrator/skills/avito-cabinet-orchestrator в ~/.cursor/skills/
```

Карта всех навыков: [SKILL.md](./SKILL.md).
