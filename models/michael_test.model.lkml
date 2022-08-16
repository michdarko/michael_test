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
