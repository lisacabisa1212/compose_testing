- view: test_account_link_clicks
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

  - dimension: group_message_id
    type: number
    sql: ${TABLE}.group_message_id

  - dimension: test_account_id
    type: string
    # hidden: true
    sql: ${TABLE}.test_account_id

  - dimension: link_url
    type: string
    sql: ${TABLE}.link_url

  - measure: total_clicks
    type: number
    sql: ${TABLE}.total_clicks

  - measure: count_distinct_with_clicks
    type: count_distinct
    drill_fields: [test_accounts.id, test_accounts.account_id, tests.name, tests.id, test_groups.name, test_groups.id, test_group_messages.name, test_group_messages.id]

