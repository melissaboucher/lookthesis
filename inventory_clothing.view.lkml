view: inventory_clothing {

#joins rows from adidas, jordan, nike, off-white, kith, yeezy
  derived_table: {
    sql: (
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.adidas_clothing`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.jordan_clothing`
      UNION ALL
      SELECT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.kith_clothing`
      UNION ALL
      SELECT DISTINCT brand, item_name, average_price, ask_count, bid_count, total_sale, total_sale_count, volatility, size, retail_price, image_url, release_date FROM `lookerdata.StockX.nike_clothing`);;
  }

  dimension: key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${brand},", ",${item_name}, ", ", CAST(${size} AS string)) ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;

    link: {
      label: "Drill into brand"
      url: "/dashboards/262?Brand={{ value | url_encode }}"
    }

  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: average_price {
    type: number
    sql: ${TABLE}.Average_Price ;;
    value_format_name: usd
  }

  dimension: ask_count {
    type: number
    sql: ${TABLE}.Ask_Count ;;
  }

  dimension: bid_count {
    type: number
    sql: ${TABLE}.Bid_Count ;;
  }

  dimension: total_sale {
    type: number
    sql: ${TABLE}.Total_Sale ;;
    value_format_name: usd
  }

  measure: sum_total_sale {
    type: sum
    sql: ${total_sale} ;;
    value_format_name: usd
  }

  dimension: total_sale_count {
    type: number
    sql: ${TABLE}.Total_Sale_Count ;;
  }

  measure: sum_total_sale_count {
    type:  sum
    sql:  ${total_sale_count} ;;
  }

  dimension: volatility {
    type: number
    sql: ${TABLE}.Volatility ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.Size ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.Retail_Price ;;
    value_format_name: usd
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.Image_URL ;;
    html: <img src="{{value}}" width="150px"/> ;;
  }

  dimension: image_url_small {
    type: string
    sql: ${TABLE}.Image_URL ;;
    html: <img src="{{value}}" style="width:50px"/> ;;
  }

  dimension: image_url_large {
    type: string
    sql: ${TABLE}.Image_URL ;;
    html: <img src="{{value}}" style="width:400px"/> ;;
  }

  dimension_group: release {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(DATE_ADD(CAST(${TABLE}.release_date as DATE), INTERVAL 2000 YEAR) as TIMESTAMP);;
  }


  measure: count {
    type: count
  }

  measure: avg_price {
    type:  average
    sql: ${average_price};;
    value_format_name: usd
  }



  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: inventory_clothing {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
