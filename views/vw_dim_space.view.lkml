# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_dim_space {
  hidden: yes

  join: vw_dim_space__amenities {
    view_label: "Vw Dim Space: Amenities"
    sql: LEFT JOIN UNNEST(${vw_dim_space.amenities}) as vw_dim_space__amenities ;;
    relationship: one_to_many
  }
}

view: vw_dim_space {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_space`
    ;;

  dimension: amenities {
    hidden: yes
    sql: ${TABLE}.Amenities ;;
  }

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }

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

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: floor_key {
    type: number
    sql: ${TABLE}.FloorKey ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
  }

  dimension: is_enabled {
    type: yesno
    sql: ${TABLE}.IsEnabled ;;
  }

  dimension: isbookable {
    type: yesno
    sql: ${TABLE}.Isbookable ;;
  }

  dimension: location_key {
    type: number
    sql: ${TABLE}.LocationKey ;;
  }

  dimension: rownum {
    type: number
    sql: ${TABLE}.ROWNUM ;;
  }

  dimension: space_id {
    type: string
    sql: ${TABLE}.SpaceId ;;
  }

  dimension: space_name {
    type: string
    sql: ${TABLE}.SpaceName ;;
  }

  dimension: space_type {
    type: string
    sql: ${TABLE}.SpaceType ;;
  }

  dimension: spacekey {
    type: number
    sql: ${TABLE}.Spacekey ;;
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

  dimension: zone_key {
    type: number
    sql: ${TABLE}.ZoneKey ;;
  }

  measure: count {
    type: count
    drill_fields: [space_name]
  }
}

view: vw_dim_space__amenities {
  dimension: amenities_key {
    type: number
    sql: AmenitiesKey ;;
  }

  dimension: amenities_name {
    type: string
    sql: AmenitiesName ;;
  }

  dimension: vw_dim_space__amenities {
    type: string
    hidden: yes
    sql: vw_dim_space__amenities ;;
  }
}
