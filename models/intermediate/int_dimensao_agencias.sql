WITH
    agencias AS (
        SELECT *
        FROM {{ ref('stg_erp_agencias') }}
    ),

    localidades AS (
        SELECT *
        FROM {{ ref('stg_erp_localidades') }}
    ),

    agencias_enriquecido AS (
        SELECT
            pk_agencia
            , nome_agencia
            , endereco_agencia
            , data_abertura_agencia
            , tipo_agencia
            , localidades.cidade AS cidade_cliente
            , localidades.uf AS uf_cliente
        FROM agencias
        LEFT JOIN localidades ON agencias.fk_localidade = localidades.pk_localidade
    )

    SELECT *
    FROM agencias_enriquecido