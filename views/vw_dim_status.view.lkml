view: vw_dim_status {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_status`
    ;;

  dimension: status_key {
    type: number
    sql: ${TABLE}.StatusKey ;;
  }

  dimension: status_name {
    type: string
    sql: ${TABLE}.StatusName ;;
  }

  measure: count {
    type: count
    drill_fields: [status_name]
  }
}
