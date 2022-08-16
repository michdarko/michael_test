# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_fct_employee_attendance {
  hidden: yes

  join: vw_fct_employee_attendance__booking_keys {
    view_label: "Vw Fct Employee Attendance: Bookingkeys"
    sql: LEFT JOIN UNNEST(${vw_fct_employee_attendance.booking_keys}) as vw_fct_employee_attendance__booking_keys ;;
    relationship: one_to_many
  }
}

view: vw_fct_employee_attendance {
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_fct_employee_attendance`
    ;;

  dimension: booking_count {
    type: number
    sql: ${TABLE}.BookingCount ;;
  }

  dimension: booking_keys {
    hidden: yes
    sql: ${TABLE}.BookingKeys ;;
  }

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
  }

  dimension: employee_attendance_key {
    type: number
    sql: ${TABLE}.employee_attendance_key ;;
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.EmployeeKey ;;
  }

  dimension: home_location_booking {
    type: yesno
    sql: ${TABLE}.HomeLocationBooking ;;
  }

  dimension: home_location_key {
    type: number
    sql: ${TABLE}.HomeLocationKey ;;
  }

  dimension: statuskey {
    type: number
    sql: ${TABLE}.Statuskey ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: vw_fct_employee_attendance__booking_keys {
  dimension: vw_fct_employee_attendance__booking_keys {
    type: number
    sql: vw_fct_employee_attendance__booking_keys ;;
  }
}
