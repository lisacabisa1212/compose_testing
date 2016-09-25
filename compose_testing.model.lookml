- connection: compose_ab_testing

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: test_accounts
  joins:
    - join: tests
      type: left_outer 
      sql_on: ${test_accounts.test_id} = ${tests.id}
      relationship: many_to_one
    - join: test_groups
      type: left_outer 
      sql_on: ${test_accounts.group_id} = ${test_groups.id}
      relationship: many_to_one

- explore: test_group_messages
  joins:
    - join: tests
      type: left_outer 
      sql_on: ${test_group_messages.test_id} = ${tests.id}
      relationship: many_to_one
    - join: test_groups
      type: left_outer 
      sql_on: ${test_group_messages.group_id} = ${test_groups.id}
      relationship: many_to_one

- explore: test_groups
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

- explore: tests
  joins:
    - join: test_accounts
      type: left_outer 
      sql_on: ${test_accounts.test_id} = ${tests.id}
      relationship: one_to_many
    - join: test_groups
      type: left_outer 
      sql_on: ${tests.id} = ${test_groups.test_id}
      relationship: one_to_many
