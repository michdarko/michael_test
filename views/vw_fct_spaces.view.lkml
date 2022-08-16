view: vw_fct_spaces {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_fct_spaces`
    ;;

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customerKey ;;
  }

  dimension: floorkey {
    type: number
    sql: ${TABLE}.floorkey ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.isDeleted ;;
  }

  dimension: isbookable {
    type: yesno
    sql: ${TABLE}.isbookable ;;
  }

  dimension: location_key {
    type: number
    sql: ${TABLE}.locationKey ;;
  }

  dimension_group: observation {
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
    sql: ${TABLE}.observation_date ;;
  }

  dimension: space_name {
    type: string
    sql: ${TABLE}.spaceName ;;
  }

  dimension: space_type {
    type: string
    sql: ${TABLE}.spaceType ;;
  }

  dimension: zonekey {
    type: number
    sql: ${TABLE}.zonekey ;;
  }

  measure: count {
    type: count
    drill_fields: [space_name]
  }
}
