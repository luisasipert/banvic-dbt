WITH
    colaboradores AS (
        SELECT *
        FROM {{ ref('stg_erp_colaboradores') }}
    ),

    localidades AS (
        SELECT *
        FROM {{ ref('stg_erp_localidades') }}
    ),

    colaboradores_enriquecido AS (
        SELECT
            colaboradores.pk_colaborador
            , colaboradores.nome_colaborador
            , colaboradores.email_colaborador
            , colaboradores.cpf_colaborador
            , colaboradores.data_nascimento_colaborador
            , colaboradores.endereco_colaborador
            , colaboradores.cep_colaborador
            , localidades.cidade AS cidade_cliente
            , localidades.uf AS uf_cliente
        FROM colaboradores
        LEFT JOIN localidades ON colaboradores.fk_localidade = localidades.pk_localidade
    )

    SELECT *
    FROM colaboradores_enriquecido