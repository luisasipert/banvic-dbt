WITH
    colaboradores AS (
        SELECT *
        FROM {{ ref('int_dimensao_colaboradores') }}
    )

SELECT *
FROM colaboradores