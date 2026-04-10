WITH
    fonte_localidades AS (
        SELECT *
        FROM {{ source('erp', 'localidades') }}
    )

    , renomeado AS (
        SELECT
            cod_localidade AS pk_localidade,
            CAST(cidade AS string) AS cidade,
            CAST(uf AS string) AS uf
        FROM fonte_localidades
    )

SELECT *
FROM renomeado