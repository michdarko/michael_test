connection: "spaces_analytics"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project


explore: dimensions {
  extension: required
  view_name:  vw_dim_space
  from:  vw_dim_space
  # description: "Spaces dimensions joined"
  # group_label: "Dimensions"
  view_label: "Spaces"

  join: vw_dim_floor {
    view_label: "Floors"
    relationship: many_to_one
    sql_on: ${vw_dim_space.floor_key}=${vw_dim_floor.floor_key} ;;
  }
  join: vw_dim_location {
    view_label: "Locations"
    relationship: many_to_one
    sql_on: ${vw_dim_floor.location_key}=${vw_dim_location.location_key} ;;
  }
  join: vw_dim_customer {
    view_label: "Customers"
    relationship: many_to_one
    sql_on: ${vw_dim_location.customer_key}=${vw_dim_customer.customer_key} ;;
  }

}

explore: dimensions_1 {
  extension: required
  view_name:  vw_fct_employee_attendance
  from:  vw_fct_employee_attendance
  # description: "Spaces dimensions joined"
  # group_label: "Dimensions"
  view_label: "Status"

  join: vw_dim_status {
    view_label: "Status"
    relationship: one_to_many
    sql_on: ${vw_dim_status.status_key} = ${vw_fct_employee_attendance.statuskey} ;;
  }
}

explore: Bookings {

  extends: [dimensions]
  join: vw_fct_bookings {
    view_label: "Bookings"
    sql_on: ${vw_fct_bookings.space_key} = ${vw_dim_space.spacekey}
      AND ${vw_fct_bookings.customer_key}=${vw_fct_bookings.customer_key};;
    relationship: many_to_one
  }
  join: vw_dim_employee {
    view_label: "Employee"
    relationship: many_to_one
    sql_on: ${vw_dim_employee.employee_key}=${vw_fct_bookings.booked_for_userkey}
      AND ${vw_dim_employee.customer_key}=${vw_fct_bookings.customer_key} ;;
  }
}

explore: Employee{
  extends: [dimensions_1]
  join: vw_dim_employee {
    view_label: "Employee"
    relationship: many_to_one
    sql_on: ${vw_dim_employee.home_location_key}=${vw_fct_employee_attendance.home_location_key}
      AND ${vw_dim_employee.employee_key}=${vw_fct_employee_attendance.employee_key} ;;
  }
  join: vw_dim_customer {
    view_label: "Customer"
    relationship: many_to_one
    sql_on: ${vw_fct_employee_attendance.customer_key}=${vw_dim_customer.customer_key} ;;
  }
  join : vw_dim_location {
    from: vw_dim_location
    view_label: "Employee Home Location"
    relationship: one_to_many
    sql_on: ${vw_dim_location.location_key}= ${vw_fct_employee_attendance.home_location_key}
      AND ${vw_dim_location.customer_key} = ${vw_fct_employee_attendance.customer_key} ;;
  }
  join: vw_fct_bookings {
    view_label: "Bookings"
    relationship: many_to_one
    sql_on: ${vw_fct_bookings.booking_key} IN UNNEST(${vw_fct_employee_attendance.booking_keys})
      and ${vw_dim_customer.customer_key} =  ${vw_fct_bookings.customer_key};;
  }
  join: vw_dim_space {
    view_label: "Booking Space"
    relationship: many_to_one
    sql_on: ${vw_dim_space.spacekey} = ${vw_fct_bookings.space_key}
      AND ${vw_dim_space.customer_key} = ${vw_fct_bookings.customer_key};;
  }
}


explore: Organisation {
  from : vw_fct_organisations
  view_name: vw_fct_organisations
  view_label: "organisation"


  join : vw_dim_location {
    view_label: "Location"
    relationship: one_to_many
    sql_on: ${vw_fct_organisations.location_key}= ${vw_dim_location.location_key}
      AND ${vw_fct_organisations.customer_key} = ${vw_dim_location.customer_key} ;;
  }
  join: vw_dim_customer {
    view_label: "Customer"
    relationship: many_to_one
    sql_on: ${vw_fct_organisations.customer_key}=${vw_dim_customer.customer_key} ;;
  }
  join:  vw_dim_employee{
    view_label: "Emoloyee"
    relationship: one_to_many
    sql_on: ${vw_fct_organisations.customer_key}=${vw_dim_employee.employee_key} ;;

  }
  join: vw_fct_bookings{
    view_label: "Bookings"
    relationship: many_to_many
    sql_on: ${vw_fct_organisations.attendees}=${vw_fct_bookings.attendees} ;;
  }

}
