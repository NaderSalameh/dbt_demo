{% macro rename_segments(column_name) %}
    case
        when lower({{column_name}}) in ('building', 'household', 'furniture') then 'segment_1'
        else 'segment_2'
    end
{% endmacro %}