WITH
    fonte_contas AS (
        SELECT *
        FROM {{ source('erp', 'contas') }}
    )

    , renomeado AS (
        SELECT
            CAST(num_conta AS INT) AS pk_conta
            , cod_cliente AS fk_cliente
            , cod_agencia AS fk_agencia
            , cod_colaborador AS fk_colaborador
            , CAST(num_conta AS INT) AS numero_conta
            , tipo_conta
            , CAST(data_abertura AS TIMESTAMP) AS ts_abertura_conta
            , CAST(saldo_total AS NUMERIC(32,2)) AS saldo_total
            , CAST(saldo_disponivel AS NUMERIC(32,2)) AS saldo_disponivel
            , CAST(data_ultimo_lancamento AS TIMESTAMP) AS ts_ultimo_lancamento
        FROM fonte_contas
    )

SELECT *
FROM renomeado