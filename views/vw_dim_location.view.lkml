# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_dim_location {
  hidden: yes

  join: vw_dim_location__office_hours {
    view_label: "Vw Dim Location: Officehours"
    sql: LEFT JOIN UNNEST(${vw_dim_location.office_hours}) as vw_dim_location__office_hours ;;
    relationship: one_to_many
  }
}

view: vw_dim_location {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_location`
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

  dimension_group: deleted {
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
    sql: ${TABLE}.DeletedDate ;;
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

  dimension: image {
    type: string
    sql: ${TABLE}.Image ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
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

  dimension: office_hours {
    hidden: yes
    sql: ${TABLE}.OfficeHours ;;
  }

  dimension: rownum {
    type: number
    sql: ${TABLE}.ROWNUM ;;
  }

  dimension: timezone_key {
    type: number
    sql: ${TABLE}.TimezoneKey ;;
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

  dimension: venue_group_name {
    type: string
    sql: ${TABLE}.VenueGroupName ;;
  }

  measure: count {
    type: count
    drill_fields: [venue_group_name, location_name]
  }
}

view: vw_dim_location__office_hours {
  dimension: element__day {
    type: string
    sql: ${TABLE}.element.day ;;
    group_label: "Element"
    group_item_label: "Day"
  }

  dimension: element__end_time {
    type: string
    sql: ${TABLE}.element.endTime ;;
    group_label: "Element"
    group_item_label: "End Time"
  }

  dimension: element__start_time {
    type: string
    sql: ${TABLE}.element.startTime ;;
    group_label: "Element"
    group_item_label: "Start Time"
  }

  dimension: vw_dim_location__office_hours {
    type: string
    hidden: yes
    sql: vw_dim_location__office_hours ;;
  }
}
