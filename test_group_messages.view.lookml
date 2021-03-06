- view: test_group_messages
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

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: campaign_id
    type: number
    sql: ${TABLE}.campaign_id

  - measure: sum_receives
    type: sum
    sql: ${TABLE}.receives

  - measure: sum_hard_bounces
    type: sum
    sql: ${TABLE}.hard_bounces

  - measure: sum_soft_bounces
    type: sum
    sql: ${TABLE}.soft_bounces

  - measure: sum_opens
    type: sum
    sql: ${TABLE}.opens

  - measure: open_rate
    type: number
    value_format: '#.00\%'
    sql: 100 * SUM(${TABLE}.opens) / NULLIF(SUM(${TABLE}.receives),0)

  - measure: sum_total_clicks
    type: sum
    sql: ${TABLE}.total_clicks

  - measure: click_thru_rate
    type: number
    value_format: '#.00\%'
    sql: 100 * SUM(${TABLE}.total_clicks) / NULLIF(SUM(${TABLE}.receives),0)

  - measure: sum_unique_clicks
    type: sum
    sql: ${TABLE}.unique_clicks

  - measure: sum_signup_link_clicks
    type: sum
    sql: ${TABLE}.signup_link_clicks

  - measure: sum_app_link_clicks
    type: sum
    sql: ${TABLE}.app_link_clicks

  - measure: sum_product_page_link_clicks
    type: sum
    sql: ${TABLE}.product_page_link_clicks

  - measure: sum_enterprise_link_clicks
    type: sum
    sql: ${TABLE}.enterprise_link_clicks

  - measure: sum_content_link_clicks
    type: sum
    sql: ${TABLE}.content_link_clicks

  - measure: sum_webinars_link_clicks
    type: sum
    sql: ${TABLE}.webinars_link_clicks

  - measure: sum_social_link_clicks
    type: sum
    sql: ${TABLE}.social_link_clicks

  - measure: sum_unsubscribe_link_clicks
    type: sum
    sql: ${TABLE}.unsubscribe_link_clicks

  - measure: sum_dismisses
    type: sum
    sql: ${TABLE}.dismisses

  - measure: sum_conversions
    type: sum
    sql: ${TABLE}.conversions

  - measure: sum_unsubscribes
    type: sum
    sql: ${TABLE}.unsubscribes

  - measure: sum_complains
    type: sum
    sql: ${TABLE}.complains

  - measure: count_distinct_group_messages
    type: count_distinct
    sql: ${TABLE}.id
    drill_fields: [id, name, tests.id, tests.name]
    


