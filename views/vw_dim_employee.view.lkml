# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: vw_dim_employee {
  hidden: yes

  join: vw_dim_employee__groups {
    view_label: "Vw Dim Employee: Groups"
    sql: LEFT JOIN UNNEST(${vw_dim_employee.groups}) as vw_dim_employee__groups ;;
    relationship: one_to_many
  }
}

view: vw_dim_employee {


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
    sql: ${TABLE}.customerKey ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}.EmployeeId ;;
    hidden: yes
  }

  dimension: employee_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.EmployeeKey ;;
    hidden: yes
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
    case_sensitive: no
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FullName ;;
    case_sensitive: no

  }

  dimension: groups {
    hidden: yes
    sql: ${TABLE}.`Groups` ;;
  }

  dimension: home_location_key {
    hidden: yes
    type: number
    sql: ${TABLE}.HomeLocationKey ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.JobTitle ;;
    case_sensitive: no
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
    case_sensitive: no
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
    drill_fields: [first_name, full_name, last_name]
  }



}

view: vw_dim_employee__groups {
  dimension: group_key {
    type: number
    sql: GroupKey ;;
  }

  dimension: group_name {
    type: string
    sql: GroupName ;;
    case_sensitive: no
  }

  dimension: vw_dim_employee__groups {
    type: string
    hidden: yes
    sql: vw_dim_employee__groups ;;
  }
}
