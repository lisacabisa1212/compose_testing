- view: tests
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

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: link
    type: string
    sql: ${TABLE}.link

  - dimension: test_segment
    type: string
    sql: ${TABLE}.test_segment

  - dimension: goal
    type: string
    sql: ${TABLE}.goal

  - dimension: primary_metric
    type: string
    sql: ${TABLE}.primary_metric

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_at

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at

  - dimension_group: last_paused
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_paused

  - dimension: show_winning
    type: yesno
    sql: ${TABLE}.show_winning

  - dimension: winning_group_id
    type: number
    sql: ${TABLE}.winning_group_id

  - dimension: confidence
    type: number
    sql: ${TABLE}.confidence

  - measure: count_distinct_tests
    type: count_distinct
    sql: ${TABLE}.id
    drill_fields: [id, name, test_accounts.count_distinct_accounts, test_group_messages.count_distinct_group_messages, test_groups.count_distinct_groups]

