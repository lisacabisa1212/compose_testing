- view: test_accounts
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

  - dimension: group_id
    type: number
    sql: ${TABLE}.group_id

  - dimension: account_id
    type: string
    sql: ${TABLE}.account_id

  - dimension_group: group_start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.group_start_at

  - dimension: coupon_redeem_id
    type: string
    sql: ${TABLE}.coupon_redeem_id

  - dimension_group: coupon_redeemed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.coupon_redeemed_at

  - dimension: converted
    type: yesno
    sql: ${TABLE}.converted

  - measure: sum_other_services_created_in_test
    type: sum
    sql: ${TABLE}.other_services_created_in_test

  - measure: sum_primary_services_created_in_test
    type: sum
    sql: ${TABLE}.primary_services_created_in_test

  - measure: count_distinct_accounts
    type: count_distinct
    sql: ${TABLE}.account_id
    drill_fields: [tests.id, tests.name, test_groups.id, test_groups.name]

  - measure: count_distinct_coupon_redeems
    type: count_distinct
    sql: ${TABLE}.coupon_redeem_id
    drill_fields: [tests.id, tests.name, test_groups.id, test_groups.name, test_accounts.account_id]
