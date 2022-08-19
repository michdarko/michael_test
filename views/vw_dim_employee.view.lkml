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
  sql_table_name: `rdx-platform.dev_dw_analytics.vw_dim_employee`;;
  fields_hidden_by_default: yes

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
    hidden: no
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
    sql: ${TABLE}.customerKey ;;
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
    hidden: no
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}.EmployeeId ;;
    hidden: no
  }

  dimension: employee_key {
    type: number
    sql: ${TABLE}.EmployeeKey ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
    hidden: no
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FullName ;;
  }

  dimension: groups {
    hidden: yes
    sql: ${TABLE}.`Groups` ;;
  }

  dimension: home_location_key {
    type: number
    sql: ${TABLE}.HomeLocationKey ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.IsDeleted ;;
    hidden: no
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.JobTitle ;;
    hidden: no
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
    hidden: no
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
  }

  dimension: vw_dim_employee__groups {
    type: string
    hidden: yes
    sql: vw_dim_employee__groups ;;
  }
}
