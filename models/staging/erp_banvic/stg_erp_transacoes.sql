WITH
    fonte_transacoes AS (
        SELECT *
        FROM {{ source('erp', 'transacoes') }}
    )

    , renomeado AS (
        SELECT
            CAST(cod_transacao AS INT) AS pk_transacao
            , CAST(num_conta AS INT) AS fk_conta
            , CAST(cod_transacao AS INT) AS numero_transacao
            , CAST(data_transacao AS DATE) data_transacao
            , CAST(data_transacao AS TIMESTAMP) ts_transacao
            , nome_transacao
            , CASE
                WHEN CAST(valor_transacao AS FLOAT) > 0 THEN 'Crédito'
                WHEN CAST(valor_transacao AS FLOAT) <0 THEN 'Débito'
                ELSE NULL
            END AS tipo_transacao
            , CAST(valor_transacao AS NUMERIC (28,2)) AS valor_transacao
        FROM fonte_transacoes
    )

SELECT *
FROM renomeado