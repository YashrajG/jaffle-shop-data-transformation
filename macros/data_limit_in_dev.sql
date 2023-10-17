{% macro data_limit_in_dev(dateColumn, dev_days_of_data=3, firstFilter=True) %}
    {# {% if target.name == 'dev' %} #}
        {% if firstFilter %}
            WHERE
        {% else %}
            AND
        {% endif %}
        {{dateColumn}} > dateadd('day', -{{dev_days_of_data}}, current_timestamp) 
    {# {% endif %} #}
{% endmacro %}