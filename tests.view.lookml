- view: tests
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: amount_in_test
    type: number
    sql: ${TABLE}.amount_in_test

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at

  - dimension: goal
    type: string
    sql: ${TABLE}.goal

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension_group: last_paused
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_paused

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: primary_metric
    type: string
    sql: ${TABLE}.primary_metric

  - dimension: show_winning
    type: yesno
    sql: ${TABLE}.show_winning

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_at

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: winning_group_id
    type: number
    sql: ${TABLE}.winning_group_id

  - measure: count
    type: count
    drill_fields: [id, name, test_accounts.count, test_group_messages.count, test_groups.count]

