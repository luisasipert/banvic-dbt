WITH
    contas AS (
        SELECT *
        FROM {{ ref('stg_erp_contas') }}
    )

    , selecionar_colunas AS (
        SELECT
            contas.pk_conta
            , contas.numero_conta
            , contas.tipo_conta
            , contas.ts_abertura_conta
        FROM contas
    )

    SELECT *
    FROM contas