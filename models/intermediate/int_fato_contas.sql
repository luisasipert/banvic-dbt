WITH
    contas AS (
        SELECT *
        FROM {{ ref('stg_erp_contas') }}
    )

    , selecionar_colunas AS (
        SELECT
            contas.pk_conta
            , contas.fk_cliente
            , contas.fk_agencia
            , contas.fk_colaborador
            , contas.saldo_total
            , contas.saldo_disponivel
            , contas.ts_ultimo_lancamento
        FROM contas
    )

    SELECT *
    FROM contas