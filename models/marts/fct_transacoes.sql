WITH
    fato_transacoes AS (
        SELECT *
        FROM {{ ref('int_fato_transacoes') }}
    )

SELECT *
FROM fato_transacoes