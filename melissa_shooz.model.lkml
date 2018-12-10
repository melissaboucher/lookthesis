connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

datagroup: melissa_shooz_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: melissa_shooz_default_datagroup

explore: inventory {
  join: item_transactions {
    type: inner
    relationship: one_to_many
    sql_on: ${inventory.brand} = ${item_transactions.brand} AND
            ${inventory.item_name} = ${item_transactions.item_name} AND
            ${inventory.size} = ${item_transactions.size};;
  }
}

# explore: item_transactions {
#   join: inventory {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${inventory.brand} = ${item_transactions.brand} AND
#             ${inventory.item_name} = ${item_transactions.item_name} AND
#             ${inventory.size} = ${item_transactions.size};;
#   }
# }

#explore: inventory {}
explore: item_transactions {}

explore: adidas {}

explore: adidas_clothing {}

explore: adidas_trans {}

explore: converse {}

explore: converse_trans {}

explore: jordan {}

explore: jordan_clothing {}

explore: jordan_clothing_trans {}

explore: jordan_trans {}

explore: kith {}

explore: kith_clothing {}

explore: kith_clothing_trans {}

explore: kith_trans {}

explore: nike {}

explore: nike_clothing {}

explore: nike_clothing_trans {}

explore: nike_trans {}

explore: off_white {}

explore: off_white_trans {}

explore: rolex {}

explore: rolex_trans {}

explore: supreme {}

explore: supreme_clothing {}

explore: supreme_shoe_trans {}

explore: supreme_trans {}

explore: yeezy {}

explore: yeezy_trans {}
