view: item_transactions {
  derived_table: {
    sql: (
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.adidas_trans`
          UNION ALL
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.converse_trans`
          UNION ALL
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.jordan_trans`
          UNION ALL
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.kith_trans`
          UNION ALL
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.nike_trans`
          UNION ALL
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.off_white_trans`
          UNION ALL
          SELECT brand, item_name, date, size, price FROM `lookerdata.StockX.supreme_shoe_trans`
          UNION ALL
          SELECT brand, item_name, date, size, sale_price AS price FROM `lookerdata.StockX.yeezy_trans`
          );;

    sql_trigger_value: SELECT FORMAT_TIMESTAMP('%F', CURRENT_TIMESTAMP(), 'America/Los_Angeles') ;;
  }

# diff in average price of item in a year (e.g. 2017) from average price of item in previous year (e.g. 2016)
#  dimension: appreciation {
#    type: number
#    sql: ;;
#  }

# this primary key isn't yet unique...
  dimension: key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${item_name}, ", ", CAST(${size} AS string)) ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.Date ;;
  }

  measure: average_price_per_2018{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2018"
    }
  }

  measure: average_price_per_2017{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2017"
    }
  }

  measure: average_price_per_2016{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2016"
    }
  }

  measure: average_price_per_2015{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2015"
    }
  }

  measure: average_price_per_2014{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2014"
    }
  }

  measure: average_price_per_2013{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2013"
    }
  }

  measure: average_price_per_2012{
    type: average
    sql: ${price} ;;
    value_format_name: usd

    filters: {
      field: date_year
      value: "2012"
    }
  }

  dimension: size {
    type: number
    sql: ${TABLE}.Size ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.Price ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }

  measure: avg_price {
    type: average
    sql: ${TABLE}.Price ;;
    value_format_name: usd
  }

}
