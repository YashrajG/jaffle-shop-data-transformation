{% macro grant_select(database=target.database, schema=target.schema, role=target.role) %}

    {% set sql %}
        GRANT USAGE ON SCHEMA {{database}}.{{schema}} TO {{role}}
        GRANT SELECT ON ALL TABLES IN SCHEMA {{database}}.{{schema}} TO {{role}}
        GRANT SELECT ON ALL VIEWS IN SCHEMA {{database}}.{{schema}} TO {{role}}
    {% endset %}

    {{ log('Granting select on all tables and views in schema ' ~ target.schema ~ ' to role ' ~ role, info=True) }}
    {% do run_query(sql) %}
    {{ log('Privileges granted', info=True) }}

{% endmacro %}