require "pg"
require "csv"
require "pry"

system "psql korning < schema.sql"

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

CSV.foreach("sales.csv", :headers => :first_row) do |row|

  name = row["employee"].split('(')[0].strip
  email = row["employee"].split('(')[1].chomp(')')
  customer = row["customer_and_account_no"].split('(')[0].strip
  account_no = row["customer_and_account_no"].split('(')[1].chomp(')')

  db_connection do |conn|
    insert_info = %Q(
      INSERT INTO employees (name, email) VALUES ('#{name}', '#{email}');
    )
    begin
      conn.exec_params(insert_info)
    rescue PG::UniqueViolation
      puts "coffee time!"
    end
  end

  db_connection do |conn|
    insert_info = %Q(
      INSERT INTO customers (customer, account_no) VALUES ('#{customer}', '#{account_no}');
    )
    begin
      conn.exec_params(insert_info)
    rescue PG::UniqueViolation
      puts "coffee time!"
    end
  end

  db_connection do |conn|
    insert_info = %Q(
      INSERT INTO products (product_name) VALUES ('#{row['product_name']}');
    )
    begin
      conn.exec_params(insert_info)
    rescue PG::UniqueViolation
      puts "coffee time!"
    end
  end
end

CSV.foreach("sales.csv", :headers => :first_row) do |row|

  def find_id (identifier, table_name, column)
    db_connection do |conn|
    get_info = %Q(
    SELECT * FROM #{table_name}
    WHERE #{column} = '#{identifier}'
    )
    conn.exec(get_info)
    end
  end

  email = row["employee"].split('(')[1].chomp(')')
  employee = find_id(email, "employees", "email")
  employee_id = employee.first["id"]

  account_no = row["customer_and_account_no"].split('(')[1].chomp(')')
  customer = find_id(account_no, "customers", "account_no")
  customer_id = customer.first["id"]

  product_name = row["product_name"]
  product = find_id(product_name, "products", "product_name")
  product_id = product.first["id"]

  db_connection do |conn|
    insert_info = %Q(
    INSERT INTO sales (sale_date, sale_amount, units_sold, invoice_no, invoice_frequency, employee_id, customer_id, product_id) VALUES ('#{row['sale_date']}', '#{row['sale_amount']}', '#{row['units_sold']}', '#{row['invoice_no']}', '#{row['invoice_frequency']}', '#{employee_id}', '#{customer_id}', '#{product_id}');
    )
    conn.exec_params(insert_info)
  end
end
