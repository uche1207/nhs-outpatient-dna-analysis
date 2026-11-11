DROP VIEW IF EXISTS "main"."vw_provider_dna_analysis";
CREATE VIEW vw_provider_dna_analysis AS

WITH selected_records AS (
    SELECT
        ORGANISATION_CODE,
        ORGANISATION_DESCRIPTION,
        MEASURE,
        CASE
            WHEN TRIM(MEASURE_VALUE) <> ''
             AND TRIM(MEASURE_VALUE) NOT GLOB '*[^0-9]*'
            THEN CAST(MEASURE_VALUE AS INTEGER)
            ELSE NULL
        END AS numeric_value
    FROM outpatient_activity
    WHERE GEOGRAPHY_LEVEL = '03.Provider'
      AND MEASURE_TYPE = 'Attendance Type'
      AND MEASURE IN (
          '01.Attended first appointment',
          '03.Attended subsequent appointment',
          '06.Did not attend first appointment',
          '08.Did not attend subsequent appointment'
      )
),

provider_totals AS (
    SELECT
        ORGANISATION_CODE AS provider_code,
        MAX(ORGANISATION_DESCRIPTION) AS provider_name,

        COUNT(*) AS measure_records,
        COUNT(DISTINCT MEASURE) AS distinct_measures,
        COUNT(numeric_value) AS valid_records,

        SUM(CASE
            WHEN MEASURE IN (
                '01.Attended first appointment',
                '03.Attended subsequent appointment'
            )
            THEN numeric_value ELSE 0
        END) AS attended,

        SUM(CASE
            WHEN MEASURE IN (
                '06.Did not attend first appointment',
                '08.Did not attend subsequent appointment'
            )
            THEN numeric_value ELSE 0
        END) AS dna

    FROM selected_records
    GROUP BY ORGANISATION_CODE
)

SELECT
    provider_code,
    provider_name,
    attended,
    dna,
    attended + dna AS appointment_volume,

    ROUND(
        100.0 * dna / NULLIF(attended + dna, 0),
        2
    ) AS selected_dna_rate_pct

FROM provider_totals

WHERE measure_records = 4
  AND distinct_measures = 4
  AND valid_records = 4
  AND attended + dna >= 1000