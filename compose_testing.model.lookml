- connection: compose_ab_testing

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: test_accounts
  sql_always_where: ${test_accounts.deleted_date} is null
  joins:
    - join: tests
      type: left_outer 
      sql_on: ${test_accounts.test_id} = ${tests.id}
      relationship: many_to_one
    - join: test_groups
      type: left_outer 
      sql_on: ${test_accounts.group_id} = ${test_groups.id}
      relationship: many_to_one
    - join: test_group_messages
      type: left_outer 
      sql_on: ${test_group_messages.group_id} = ${test_groups.id}
      relationship: many_to_many
    - join: test_account_link_clicks
      type: left_outer 
      sql_on: ${test_account_link_clicks.test_account_id} = ${test_accounts.id}
      relationship: one_to_many

- explore: test_account_link_clicks
  sql_always_where: ${test_account_link_clicks.deleted_date} is null
  joins:
    - join: tests
      type: left_outer 
      sql_on: ${test_account_link_clicks.test_id} = ${tests.id}
      relationship: many_to_one
    - join: test_accounts
      type: left_outer 
      sql_on: ${test_account_link_clicks.test_account_id} = ${test_accounts.id}
      relationship: many_to_one
    - join: test_groups
      type: left_outer 
      sql_on: ${test_account_link_clicks.group_id} = ${test_groups.id}
      relationship: many_to_one
    - join: test_group_messages
      type: left_outer 
      sql_on: ${test_group_messages.id} = ${test_account_link_clicks.group_message_id}
      relationship: many_to_one
      
- explore: test_group_messages
  sql_always_where: ${test_group_messages.deleted_date} is null
  joins:
    - join: tests
      type: left_outer 
      sql_on: ${test_group_messages.test_id} = ${tests.id}
      relationship: many_to_one
    - join: test_groups
      type: left_outer 
      sql_on: ${test_group_messages.group_id} = ${test_groups.id}
      relationship: many_to_one
    - join: test_accounts
      type: left_outer 
      sql_on: ${test_accounts.group_id} = ${test_groups.id}
      relationship: many_to_one
    - join: test_account_link_clicks
      type: left_outer 
      sql_on: ${test_account_link_clicks.group_message_id} = ${test_group_messages.id}
      relationship: one_to_many

- explore: test_groups
  sql_always_where: ${test_groups.deleted_date} is null
  joins:
    - join: tests
      type: left_outer 
      sql_on: ${test_groups.test_id} = ${tests.id}
      relationship: many_to_one
    - join: test_group_messages
      type: left_outer 
      sql_on: ${test_groups.id} = ${test_group_messages.group_id}
      relationship: one_to_many
    - join: test_accounts
      type: left_outer 
      sql_on: ${test_accounts.group_id} = ${test_groups.id}
      relationship: many_to_one
    - join: test_account_link_clicks
      type: left_outer 
      sql_on: ${test_account_link_clicks.group_id} = ${test_groups.id}
      relationship: one_to_many

- explore: tests
  sql_always_where: ${tests.deleted_date} is null
  joins:
    - join: test_accounts
      type: left_outer 
      sql_on: ${test_accounts.test_id} = ${tests.id}
      relationship: one_to_many
    - join: test_groups
      type: left_outer 
      sql_on: ${tests.id} = ${test_groups.test_id}
      relationship: one_to_many
    - join: test_group_messages
      type: left_outer 
      sql_on: ${test_group_messages.group_id} = ${test_groups.id}
      relationship: one_to_many
    - join: test_account_link_clicks
      type: left_outer 
      sql_on: ${test_account_link_clicks.test_id} = ${tests.id}
      relationship: one_to_many
