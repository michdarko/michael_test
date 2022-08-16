view: vw_fct_locations {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_fct_locations`
    ;;

  dimension: bookable_space_count_desk {
    type: number
    sql: ${TABLE}.bookable_space_Count_desk ;;
  }

  dimension: bookable_space_count_meetingroom {
    type: number
    sql: ${TABLE}.bookable_space_Count_meetingroom ;;
  }

  dimension: bookable_space_count_parking {
    type: number
    sql: ${TABLE}.bookable_space_Count_parking ;;
  }

  dimension: bookable_space_count_zone {
    type: number
    sql: ${TABLE}.bookable_space_Count_zone ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }

  dimension: employee_count {
    type: number
    sql: ${TABLE}.employeeCount ;;
  }

  dimension: locationkey {
    type: number
    sql: ${TABLE}.locationkey ;;
  }

  dimension: space_count_desk {
    type: number
    sql: ${TABLE}.space_count_desk ;;
  }

  dimension: space_count_meetingroom {
    type: number
    sql: ${TABLE}.space_count_meetingroom ;;
  }

  dimension: space_count_zone {
    type: number
    sql: ${TABLE}.space_count_zone ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
