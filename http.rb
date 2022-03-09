require "http"
require "tty-table"


result = HTTP.get("http://localhost:3000/all")

result1 = result.parse(:json)



table = TTY::Table.new(["Product","Cost"], [["#{result1[0]["name"]}", "#{result1[0]["price"]}"], ["#{result1[1]["name"]}", "#{result1[1]["price"]}"], ["#{result1[2]["name"]}","#{result1[2]["price"]}"]])

puts table.render(:ascii)

