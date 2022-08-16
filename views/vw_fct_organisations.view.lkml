view: vw_fct_organisations {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_fct_organisations`
    ;;

  dimension: attendees {
    type: number
    sql: ${TABLE}.Attendees ;;
  }

  dimension: avail_time {
    type: number
    sql: ${TABLE}.AvailTime ;;
  }

  dimension: count_book {
    type: number
    sql: ${TABLE}.CountBook ;;
  }

  dimension: count_cancel {
    type: number
    sql: ${TABLE}.CountCancel ;;
  }

  dimension: count_location {
    type: number
    sql: ${TABLE}.CountLocation ;;
  }

  dimension: count_space {
    type: number
    sql: ${TABLE}.CountSpace ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.Latitude ;;
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.LocationId ;;
  }

  dimension: location_key {
    type: number
    sql: ${TABLE}.LocationKey ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.LocationName ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.Longitude ;;
  }

  dimension: max_capacity {
    type: number
    sql: ${TABLE}.MaxCapacity ;;
  }

  dimension: primary_key {
    type: string
    sql: ${TABLE}.PrimaryKey ;;
  }

  dimension: time_utilised {
    type: number
    sql: ${TABLE}.TimeUtilised ;;
  }

  dimension: utilisation_space {
    type: number
    sql: ${TABLE}.UtilisationSpace ;;
  }

  measure: count {
    type: count
    drill_fields: [location_name, customer_name]
  }
}
