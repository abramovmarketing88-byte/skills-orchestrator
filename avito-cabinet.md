# Как разбираем кабинет Авито

Два навыка работают парой.

1. Сначала снимаем данные по API: объявления, фид автозагрузки, просмотры и контакты.
   https://github.com/abramovmarketing88-byte/avito-api-skill

   Ключи кабинета кладутся локально в `.env.local` и в чат не пишутся. Один набор ключей — один аккаунт.

2. Потом разбор бюджета: куда ушли деньги, цена обращения, какие объявления кормят кабинет и какие его съедают.
   https://github.com/abramovmarketing88-byte/avito-budget-review

   Этот навык сам в API не ходит. Он читает файлы, которые снял первый.

Отдельно, если нужна одна карточка, а не весь кабинет: открываем объявление на сайте и ставим оценку заголовку, цене, фото и профилю.
https://github.com/abramovmarketing88-byte/avito-listing-audit

## Поставить себе в Cursor

```bash
gh skill install abramovmarketing88-byte/avito-api-skill --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-budget-review --agent cursor --scope user
gh skill install abramovmarketing88-byte/avito-listing-audit --agent cursor --scope user
```

Карта всех навыков: [SKILL.md](./SKILL.md).
