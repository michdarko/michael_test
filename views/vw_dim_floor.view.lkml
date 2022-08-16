view: vw_dim_floor {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_floor`
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

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }

  dimension: designed_capacity {
    type: number
    sql: ${TABLE}.DesignedCapacity ;;
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

  dimension: floor_id {
    type: string
    sql: ${TABLE}.floorId ;;
  }

  dimension: floor_key {
    type: number
    sql: ${TABLE}.floorKey ;;
  }

  dimension: floor_name {
    type: string
    sql: ${TABLE}.floorName ;;
  }

  dimension: floor_number {
    type: number
    sql: ${TABLE}.FloorNumber ;;
  }

  dimension: floor_order {
    type: number
    sql: ${TABLE}.FloorOrder ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
  }

  dimension: location_key {
    type: number
    sql: ${TABLE}.LocationKey ;;
  }

  dimension: max_capacity {
    type: number
    sql: ${TABLE}.MaxCapacity ;;
  }

  dimension: rownum {
    type: number
    sql: ${TABLE}.ROWNUM ;;
  }

  dimension: target_capacity {
    type: number
    sql: ${TABLE}.TargetCapacity ;;
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
    drill_fields: [floor_name]
  }
}
