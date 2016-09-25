- view: test_group_messages
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - measure: complains
    type: number
    sql: ${TABLE}.complains

  - measure: content_link_clicks
    type: number
    sql: ${TABLE}.content_link_clicks

  - measure: conversions
    type: number
    sql: ${TABLE}.conversions

  - dimension_group: deleted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.deleted_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - measure: dismisses
    type: number
    sql: ${TABLE}.dismisses

  - dimension: group_id
    type: number
    sql: ${TABLE}.group_id

  - measure: hard_bounces
    type: number
    sql: ${TABLE}.hard_bounces

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.inserted_at

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: opens
    type: number
    sql: ${TABLE}.opens

  - measure: other_cta_clicks
    type: number
    sql: ${TABLE}.other_cta_clicks

  - measure: primary_cta_clicks
    type: number
    sql: ${TABLE}.primary_cta_clicks

  - measure: receives
    type: number
    sql: ${TABLE}.receives

  - measure: sends
    type: number
    sql: ${TABLE}.sends

  - measure: soft_bounces
    type: number
    sql: ${TABLE}.soft_bounces

  - dimension: test_id
    type: number
    # hidden: true
    sql: ${TABLE}.test_id

  - measure: total_clicks
    type: number
    sql: ${TABLE}.total_clicks

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: unique_clicks
    type: number
    sql: ${TABLE}.unique_clicks

  - measure: unsubscribes
    type: number
    sql: ${TABLE}.unsubscribes

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, name, tests.id, tests.name]

