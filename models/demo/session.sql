{{
    config
    (
        materialized = 'table'
    )
}}

WITH session_src AS (
    SELECT
        SESSION_ID,
        USER_ID,
        BROWSER,
        DEVICE_TYPE,
        b.COUNTRY_NAME AS COUNTRY_NAME,
        b.CONTINENT AS CONTINENT,
        b.CURRENCY AS CURRENCY,
        START_TIME,
        END_TIME,
        PAGES_VISISTED,
        CURRENT_TIMESTAMP AS INSERT_DTS
    FROM {{source('session','SESSION_SRC')}} a
    LEFT JOIN {{ref('country_code')}} b
    ON a.COUNTRY_CODE = b.COUNTRY_CODE
)

SELECT * FROM session_src