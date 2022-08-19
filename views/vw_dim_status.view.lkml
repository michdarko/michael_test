
view: vw_dim_status {


  dimension: status_key {
    hidden: yes
    type: number
    sql: ${TABLE}.StatusKey ;;
    primary_key: yes
  }

  dimension: status_name {
    type: string
    sql:COALESCE( ${TABLE}.StatusName ,'Unknown');;
  }

  measure: Count_Status_Type{
    type: count
    drill_fields: [status_name]
  }
  measure: employee_attendance {
    type : sum
    sql: vw_fct_employee_attendance.BookingCount ;;
    drill_fields: [vw_dim_employee.full_name,vw_dim_group.group_name,vw_dim_calendar.day_date,status_name,vw_dim_space.space_name]
  }


}
