- view: test_groups
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: test_id
    type: number
    # hidden: true
    sql: ${TABLE}.test_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: amount_in_group
    type: number
    sql: ${TABLE}.amount_in_group

  - measure: sum_coupon_redeems
    type: sum
    sql: ${TABLE}.coupon_redeems

  - measure: sum_accounts_with_primary_services_created_in_test
    type: sum
    sql: ${TABLE}.accounts_with_primary_services_created_in_test

  - measure: sum_accounts_with_other_services_created_in_test
    type: sum
    sql: ${TABLE}.accounts_with_other_services_created_in_test

  - measure: sum_primary_services_created_in_test
    type: sum
    sql: ${TABLE}.primary_services_created_in_test

  - measure: sum_other_services_created_in_test
    type: sum
    sql: ${TABLE}.other_services_created_in_test

  - measure: sum_conversions
    type: sum
    sql: ${TABLE}.conversions

  - dimension: winning_group
    type: yesno
    sql: ${TABLE}.winning_group

  - measure: confidence
    type: number
    sql: ${TABLE}.confidence

  - measure: count_distinct_groups
    type: count_distinct
    drill_fields: [id, name, tests.id, tests.name]

