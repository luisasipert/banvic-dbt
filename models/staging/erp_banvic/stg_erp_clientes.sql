WITH
    fonte_clientes AS (
        SELECT *
        FROM {{ source('erp', 'clientes') }}
    )

    , renomeado AS (
        SELECT
            CAST(cod_cliente AS INT) AS pk_cliente,
            CAST(cod_localidade AS INT) AS fk_localidade,
            primeiro_nome || ' ' || ultimo_nome AS nome_cliente, --|| é usado pra concatenar, como & no excel
            email AS email_cliente,
            tipo_cliente,
            CAST(data_inclusao AS timestamp) AS ts_inclusao,
            REGEXP_REPLACE(cpfcnpj,'[^a-zA-Z0-9]', '') AS cpfcnpj_cliente, --substitui o que não for de a-z, A-Z e 0-9 por ""
            CAST(data_nascimento AS date) AS data_nascimento_cliente,
            endereco AS endereco_cliente,
            regexp_replace(cep,'[^a-zA-Z0-9]', '') AS cep_cliente
        FROM fonte_clientes
    )

SELECT *
FROM renomeado
