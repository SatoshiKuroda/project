require 'pg'
begin
  connect = PG::connect(host: "localhost", user: "sk", password: "user001", dbname: "test_kintai_development", port: "5432")
rescue
  p "えらー"
end

results = connect.exec("COPY kintai_data (employee_number,date,work_in,work_out,rest_in,rest_out) FROM '/Users/sk/rails/kintai.csv' WITH CSV")

