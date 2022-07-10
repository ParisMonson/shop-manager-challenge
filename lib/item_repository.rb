require 'item'
require 'database_connection'

class ItemRepository

    def all
      # Executes the SQL query:
      sql = "SELECT id, name, price, quantity FROM items;"

      result_set = DatabaseConnection.exec_params(sql, [])

      convert(result_set)
    end
  
    def create(item)
     # returns nothing
  
    end

    private

    def convert(result_set)
        items = []
        result_set.each do |record|
            item = Item.new
            item.id = record["id"].to_i
            item.name = record["name"]
            item.price = record["price"].to_f
            item.quantity = record["quantity"].to_i
            items << item
        end
        items
    end
end