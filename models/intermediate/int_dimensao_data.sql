with
    date_spine AS (
        {{ dbt_utils.date_spine(
        datepart = "day",
        start_date = "cast('2000-01-01' as date)",
        end_date = "cast('2030-01-01' as date)"
   )
}}
    )

    , criar_datas AS (
        SELECT
            ROW_NUMBER() OVER(ORDER BY date_day) as pk_data --criando um ID sequencial de 1, 2, 3...
            , CAST(date_day AS DATE) AS dt_data
            , EXTRACT(DAY FROM date_day) AS dia
            , EXTRACT(MONTH FROM date_day) AS mes
            , EXTRACT(YEAR FROM date_day) AS ano
            , EXTRACT(QUARTER FROM date_day) AS trimestre
            , CASE
                WHEN EXTRACT(DOW FROM date_day) IN (0, 6) THEN true
                ELSE false
            END AS is_weekend
        FROM date_spine
    )

SELECT *
FROM criar_datas