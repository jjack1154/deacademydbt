/* Generic tests that can be performed on any data object */

{% test salary_check(model, column_name) %}

SELECT * FROM
{{ model }}
WHERE {{ column_name }} < 10000

{% endtest %}


/* Check for null or missing values */

{% test null_check(model, column_name) %}

SELECT * FROM
{{ model }}
WHERE {{ column_name }} IS NULL

{% endtest %}
