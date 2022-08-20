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
    hidden: yes
    type: number
    sql: ${TABLE}.BookedForUserkey ;;
  }

  dimension: booking_id {
    hidden: yes
    type: string
    sql: ${TABLE}.BookingId ;;
  }

  dimension: booking_key {
    hidden: yes
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

  dimension_group: cancelled {
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

  dimension_group: checked_out {
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

  dimension_group: chedked_in {
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

  dimension_group: created{
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
    hidden: yes

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
    hidden: yes
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
    hidden: yes
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

  dimension_group: end_time {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
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


  dimension: space_key {
    hidden: yes
    type: number
    sql: ${TABLE}.SpaceKey ;;
  }

  dimension: space_label_name {
    type: string
    sql: ${TABLE}.SpaceLabelName ;;
  }

  dimension_group: start_time {
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
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
    hidden: yes
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
  # all bookiings
  measure: all_booking_count {
    type: count
    drill_fields: [vw_dim_employee.full_name,vw_dim_group.group_name,start_time_date,vw_dim_status.status_name,vw_dim_space.space_name]
  }

  measure: count_days {
    type : count_distinct
    sql: ${start_time_date} ;;
  }

  dimension_group: booking {
    type: duration
    sql_start:  ${start_time_raw} ;;  # often this is a single database column
    sql_end:  ${end_time_raw}  ;;  # often this is a single database column
    intervals: [minute,hour] # valid intervals described below
  }
  measure: booking_duration_mins {
    type: sum
    sql: ${TABLE}.BookingDurationMins ;;
  }
  dimension_group: booked_in_advance {
    type: duration
    sql_start:  ${created_raw} ;;  # often this is a single database column
    sql_end:  ${start_time_raw}  ;;  # often this is a single database column
    intervals: [minute,hour,day] # valid intervals described below
  }

  measure: booked_in_advance_mins {
    type: sum
    sql: ${TABLE}.BookedInAdvanceMins ;;
  }


  dimension_group: cancelled_in_advance {
    type: duration
    sql_start:  ${cancelled_raw} ;;  # often this is a single database column
    sql_end:  ${start_time_raw}  ;;  # often this is a single database column
    intervals: [minute,hour,day] # valid intervals described below
  }

  measure: cancelled_in_advance_mins {
    type: sum
    sql: ${TABLE}.CancelledInAdvanceMins ;;
  }

  measure: cancelled_booking_count {
    type: count
    filters: [is_cancelled: "yes"]
    drill_fields: [vw_dim_employee.full_name,vw_dim_group.group_name,start_time_date,vw_dim_status.status_name,vw_dim_space.space_name]
  }

  measure: booking_count {
    type: count
    filters: [is_cancelled: "no"]
    drill_fields: [vw_dim_employee.full_name,vw_dim_group.group_name,start_time_date,vw_dim_status.status_name,vw_dim_space.space_name]
  }

  measure: checked_in_booking_count {
    type: count
    filters: [is_checked_in: "yes"]
    drill_fields: [vw_dim_employee.full_name,vw_dim_group.group_name,start_time_date,vw_dim_status.status_name,vw_dim_space.space_name]
  }

  measure:checked_in_rate {
    type: number
    sql: ${vw_fct_bookings.checked_in_booking_count} / ${vw_fct_bookings.booking_count} ;;
    value_format: "0\%"
  }
  measure:cancellation_rate {
    type: number
    sql: ${vw_fct_bookings.cancelled_booking_count} / ${vw_fct_bookings.all_booking_count} ;;
    value_format: "0\%"
  }

  measure: number_of_attendees{
    type: number
    sql: ARRAY_LENGTH(${TABLE}.Attendees)  ;;
  }
  dimension: booked_in_advance_bucket {

    case: {
      when: {
        sql: ${created_date} = ${start_time_date};;
        label: "On Day"
      }
      when: {
        sql: date_diff(${created_date},${start_time_date},day) = 1;;
        label: "1 Day"
      }
      when: {
        sql: date_diff(${created_date},${start_time_date},day) <=7;;
        label: "Up to 7 Days"
      }
      when: {
        sql: date_diff(${created_date},${start_time_date},day) <=14;;
        label: "Up to 2 weeks"
      }
      when: {
        sql: date_diff(${created_date},${start_time_date},day) <=21;;
        label: "Up to 3 weeks"
      }
      else:"Greater Than 3 Weeks"
    }
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
