- view: test_groups
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - measure: accounts_with_other_services_created_in_test
    type: number
    sql: ${TABLE}.accounts_with_other_services_created_in_test

  - measure: accounts_with_primary_services_created_in_test
    type: number
    sql: ${TABLE}.accounts_with_primary_services_created_in_test

  - dimension: amount_in_group
    type: number
    sql: ${TABLE}.amount_in_group

  - measure: confidence
    type: number
    sql: ${TABLE}.confidence

  - measure: conversions
    type: number
    sql: ${TABLE}.conversions

  - measure: coupon_redeems
    type: number
    sql: ${TABLE}.coupon_redeems

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: other_services_created_in_test
    type: number
    sql: ${TABLE}.other_services_created_in_test

  - measure: primary_services_created_in_test
    type: number
    sql: ${TABLE}.primary_services_created_in_test

  - dimension: test_id
    type: number
    # hidden: true
    sql: ${TABLE}.test_id

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: winning_group
    type: yesno
    sql: ${TABLE}.winning_group

  - measure: count
    type: count
    drill_fields: [id, name, tests.id, tests.name]

