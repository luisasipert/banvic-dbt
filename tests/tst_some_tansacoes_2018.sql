/*
    Este teste certifica que as transações de 2018 batem com o valor auditado de 822.808,44
*/

WITH
    soma_transacoes_2018 AS (
        SELECT
            EXTRACT(YEAR FROM data_transacao) AS ano
            , SUM(valor_transacao) AS total
        FROM {{ ref('int_fato_transacoes') }}
        GROUP BY 1
    )

SELECT *
FROM soma_transacoes_2018
WHERE ano = 2018
    AND total NOT BETWEEN(822808.39 AND 822808.49)