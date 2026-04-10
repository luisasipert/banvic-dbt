WITH
    fonte_agencias AS (
        SELECT *
        FROM {{ source('erp', 'agencias') }}
    )

    , renomeado AS (
        SELECT
            CAST(cod_agencia AS INT) AS pk_agencia
            , CAST(cod_localidade AS INT) AS fk_localidade
            , nome AS nome_agencia
            , endereco AS endereco_agencia
            , CAST(data_abertura AS date) AS data_abertura_agencia
            , tipo_agencia AS tipo_agencia
        FROM fonte_agencias
    )

SELECT *
FROM renomeado