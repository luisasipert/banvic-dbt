WITH
    transacoes AS (
        SELECT
            pk_transacao
            , fk_conta
            , numero_transacao
            , data_transacao
            , ts_transacao
            , nome_transacao
            , tipo_transacao
            , valor_transacao
        FROM {{ ref('stg_erp_transacoes') }}
    )

    , contas AS (
        SELECT
            pk_conta
            , fk_cliente
            , fk_agencia
            , fk_colaborador
        FROM {{ ref('int_fato_contas') }}
    )

    , datas AS (
        SELECT
            pk_data
            , data_completa
        FROM {{ ref('int_dimensao_data') }}
    )

    , joined AS (
        SELECT
            transacoes.pk_transacao
            , transacoes.fk_conta
            , datas.pk_data AS fk_data
            , contas.fk_cliente
            , contas.fk_agencia
            , contas.fk_colaborador
            , transacoes.numero_transacao
            , transacoes.data_transacao
            , transacoes.ts_transacao
            , transacoes.nome_transacao
            , transacoes.tipo_transacao
            , transacoes.valor_transacao
        FROM transacoes
        LEFT JOIN contas ON transacoes.fk_conta = contas.pk_conta
        LEFT JOIN datas ON transacoes.data_transacao = datas.data_completa
    )

SELECT *
FROM joined