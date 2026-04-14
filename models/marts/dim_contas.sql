WITH
    contas AS (
        SELECT *
        FROM {{ ref('int_dimensao_contas') }}
    )

SELECT *
FROM contas