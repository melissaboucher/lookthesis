view: nike_clothing {
  sql_table_name: StockX.nike_clothing ;;

  dimension: annual_high {
    type: number
    sql: ${TABLE}.Annual_High ;;
  }

  dimension: annual_low {
    type: number
    sql: ${TABLE}.Annual_Low ;;
  }

  dimension: ask_count {
    type: number
    sql: ${TABLE}.Ask_Count ;;
  }

  dimension: average_price {
    type: number
    sql: ${TABLE}.Average_Price ;;
  }

  dimension: bid_count {
    type: number
    sql: ${TABLE}.Bid_Count ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: brand1 {
    type: string
    sql: ${TABLE}.Brand1 ;;
  }

  dimension: current_highest_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Current_Highest_Bid ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.Image_URL ;;
    html: <img src="{{value}}" width="150px"/> ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.Item_Name ;;
  }

  dimension: last_sale_price {
    type: number
    sql: ${TABLE}.Last_Sale_Price ;;
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
    sql: ${TABLE}.Release_Date ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.Retail_Price ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.Size ;;
  }

  dimension: string_field_6 {
    type: string
    sql: ${TABLE}.string_field_6 ;;
  }

  dimension: total_sale {
    type: number
    sql: ${TABLE}.Total_Sale ;;
  }

  dimension: total_sale_count {
    type: number
    sql: ${TABLE}.Total_Sale_Count ;;
  }

  dimension: volatility {
    type: number
    sql: ${TABLE}.Volatility ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }
}
