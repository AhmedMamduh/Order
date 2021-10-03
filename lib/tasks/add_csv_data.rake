require 'csv'

namespace :add_csv_data do
  task product_data: :environment do
    CSV.foreach("product.csv", headers: true) do |row|
      Product.find_or_create_by({ product_name: row["product_name"], price: row["price"], quantity: row["quantity"]})
    end
  end
end