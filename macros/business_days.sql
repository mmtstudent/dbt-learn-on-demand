
{% macro business_days(start_date, end_date) %}
    DATEDIFF(DAY, {{start_date}},{{end_date}}) + 1 
    - DATEDIFF(WEEK,{{start_date}},dateadd(day ,1,{{end_date}}))*2 
    + IFF(DAYNAME{{start_date}}) = 'Sun', 1, 0)
    - IFF(DAYNAME({{end_date}}) = 'Sat', 1, 0)
{% endmacro %}