view: vw_dim_calendar {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_calendar`
    ;;

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: day_is_weekday {
    type: yesno
    sql: ${TABLE}.day_is_weekday ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
