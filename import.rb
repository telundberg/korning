# Use this file to import the sales information into the
# the database.

require "pg"
require "csv"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach('sales.csv', headers: true) do |seam|
    employees = seam['employee'].split[0..1].join(" ")
    employees_email = seam['employee'].split[2][1..-2]
    customers = seam['customer_and_account_no']
    products = seam['product_name']
    invoice_frequency = seam['invoice_frequency']
    invoice_no = seam['invoice_no']
    sale_date = seam['sale_date']
    sale_amount = seam['sale_amount']
    units_sold = seam['units_sold']
  db_connection do |element|
     element.exec_params("INSERT INTO glass (
      employee,
      employee_email,
      customer_and_account_no,
      product_name,
      invoice_frequency,
      invoice_no,
      sale_date,
      sale_amount,
      units_sold)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)",
    [employees,
    employees_email,
    customers,
    products,
    invoice_frequency,
    invoice_no,
    sale_date,
    sale_amount,
    units_sold,])
  end
end
