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

  - dimension: winning_group
    type: yesno
    sql: ${TABLE}.winning_group

  - dimension: confidence
    type: number
    sql: ${TABLE}.confidence

  - measure: sum_coupon_redeems
    type: sum
    sql: ${TABLE}.coupon_redeems
    
  - measure: coupon_redeem_rate
    type: number
    value_format: '#.00\%'
    sql: 100 * SUM(${TABLE}.coupon_redeems) / NULLIF(${test_group_messages.sum_receives},0)

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

  - measure: conversion_rate
    type: number
    value_format: '#.00\%'
    sql: 100 * SUM(${TABLE}.conversions) / CASE WHEN ${test_group_messages.sum_receives} = 0 THEN ${test_groups.amount_in_group} ELSE ${test_group_messages.sum_receives} END

  - measure: count_distinct_groups
    type: count_distinct
    sql: ${TABLE}.id
    drill_fields: [id, name, tests.id, tests.name]

