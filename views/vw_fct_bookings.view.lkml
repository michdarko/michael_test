# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_fct_bookings {
  hidden: yes

  join: vw_fct_bookings__attendees {
    view_label: "Vw Fct Bookings: Attendees"
    sql: LEFT JOIN UNNEST(${vw_fct_bookings.attendees}) as vw_fct_bookings__attendees ;;
    relationship: one_to_many
  }
}

view: vw_fct_bookings {


  dimension: attendees {
    hidden: yes
    sql: ${TABLE}.Attendees ;;
  }

  dimension: booked_for_userkey {
    type: number
    sql: ${TABLE}.BookedForUserkey ;;
  }

  dimension: booking_id {
    type: string
    sql: ${TABLE}.BookingId ;;
  }

  dimension: booking_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.BookingKey ;;
  }

  dimension: booking_method {
    type: string
    sql: ${TABLE}.BookingMethod ;;
  }

  dimension: booking_type {
    type: string
    sql: ${TABLE}.BookingType ;;
  }

  dimension_group: cancelled_date_tz {
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
    datatype: datetime
    sql: ${TABLE}.CancelledDateTZ ;;
  }

  dimension: cancelled_reason {
    type: string
    sql: ${TABLE}.CancelledReason ;;
  }

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }

  dimension_group: checked_out_time_tz {
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
    datatype: datetime
    sql: ${TABLE}.CheckedOutTimeTZ ;;
  }

  dimension_group: chedked_in_time_tz {
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
    datatype: datetime
    sql: ${TABLE}.ChedkedInTimeTZ ;;
  }

  dimension: cost_centre {
    type: string
    sql: ${TABLE}.CostCentre ;;
  }

  dimension_group: created_date_tz {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.CreatedDateTZ ;;
  }

  dimension_group: created_date_utc {
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
    sql: ${TABLE}.CreatedDateUTC ;;
  }

  dimension_group: curated_loaded {
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
    sql: ${TABLE}.CuratedLoaded ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
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

  dimension_group: end_time_tz {
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
    sql: ${TABLE}.EndTimeTZ ;;
  }

  dimension: is_cancelled {
    type: yesno
    sql: ${TABLE}.IsCancelled ;;
  }

  dimension: is_checked_in {
    type: yesno
    sql: ${TABLE}.IsCheckedIn ;;
  }

  dimension: rownum {
    type: number
    sql: ${TABLE}.ROWNUM ;;
  }

  dimension: space_key {
    type: number
    sql: ${TABLE}.SpaceKey ;;
  }

  dimension: space_label_name {
    type: string
    sql: ${TABLE}.SpaceLabelName ;;
  }

  dimension_group: start_time_tz {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_week
    ]
    sql: ${TABLE}.StartTimeTZ ;;
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

  measure: count {
    type: count
    drill_fields: [space_label_name]
  }
  measure: count_days {
    type : count_distinct
    sql: ${start_time_tz_date} ;;
  }

  dimension_group: booking {
    type: duration
    sql_start:  ${start_time_tz_raw} ;;  # often this is a single database column
    sql_end:  ${end_time_tz_raw}  ;;  # often this is a single database column
    intervals: [minute,hour] # valid intervals described below
  }
  measure: booking_duration_mins {
    type: sum
    sql: ${TABLE}.BookingDurationMins ;;
  }


}

view: vw_fct_bookings__attendees {
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: is_host {
    type: yesno
    sql: IsHost ;;
  }

  dimension: name {
    type: string
    sql: Name ;;
  }

  dimension: user_type {
    type: string
    sql: UserType ;;
  }

  dimension: vw_fct_bookings__attendees {
    type: string
    hidden: yes
    sql: vw_fct_bookings__attendees ;;
  }


}
