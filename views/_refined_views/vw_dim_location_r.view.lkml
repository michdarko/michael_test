include: "/views/vw_dim_location.view.lkml"

view: +vw_dim_location {
  label: "Location"

#### DIMENSIONS #### {

  dimension_group: created {
    group_label: "Dates"
    description: "This is the date of abc"
  }

  dimension: customer_key {
    hidden: yes
  }

  dimension_group: deleted {
    description: "This is the date of abc"
    group_label: "Dates"
  }

  dimension: image {
  }

  dimension: is_deleted {
  }

  dimension: latitude {
  }

  dimension_group: loaded {
    hidden: yes
  }

  dimension: location_id {
    hidden: yes
  }

  dimension: location_key {
    hidden: yes
    primary_key: yes
  }

  dimension: location_name {
  }

  dimension: longitude {
  }

  dimension: office_hours {
  }

  dimension: timezone_key {
    hidden: yes
  }

  dimension_group: updated {
  }

  dimension: venue_group_name {
  }

#### DIMENSIONS #### }


#### MEASURES #### {


#### MEASURES #### }


}
