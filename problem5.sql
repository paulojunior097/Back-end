SELECT "produtos"."id",
        FROM dev_challenge.produtos
        LEFT JOIN "ordem_produtos" ON "ordem_produtos"."produto_id" = "produtos"."id"
        LEFT JOIN "orders" ON "ordens_produtos"."ordem_id" = "ordens"."id"
        WHERE "ordens"."id" = 0
        COUNT;

SELECT date_create, price, (price) as total
        FROM dev_challenge.ordens
        WHERE date_create = (SELECT CONVERT (date, SYSDATETIME()))
        GROUP BY date_create, price
