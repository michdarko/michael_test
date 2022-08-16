view: vw_dim_customer {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_customer`
    ;;

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension_group: curated_loaded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CuratedLoaded ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.CustomerId ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.CustomerName ;;
  }

  dimension_group: dwloaded {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DWLoaded ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
  }

  dimension: is_subscription_enabled {
    type: yesno
    sql: ${TABLE}.IsSubscriptionEnabled ;;
  }

  dimension: is_trial {
    type: yesno
    sql: ${TABLE}.IsTrial ;;
  }

  dimension: logo {
    type: string
    sql: ${TABLE}.Logo ;;
  }

  dimension: rownum {
    type: number
    sql: ${TABLE}.Rownum ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.UpdatedDate ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
