WITH
    agencias AS (
        SELECT *
        FROM {{ ref('int_dimensao_agencias') }}
    )

SELECT *
FROM agencias