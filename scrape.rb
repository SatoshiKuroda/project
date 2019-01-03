require 'nokogiri'
require 'open-uri'
require 'csv'

employee_number = ["001504","001505"]
url = 'http://stg.work.dh-manager.jp/shift/send_application/time_record_view/staff_no/'
params = ["stg","0zUtEJX1w4Ex"]
charset = nil

kintai_data=[]
kintai = []
employee_number.each do |number|
    html = open("#{url}#{number}",{http_basic_authentication: params}) do |f|
        charset = f.charset
        f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    CSV.open("kintai.csv","a") do |csv|
        doc.xpath('//tr[position()>=2]').each do |node|
            
            date        = node.css('td[1]').inner_text
            work_in     = node.css('td[2]').inner_text
            work_out    = node.css('td[3]').inner_text
            rest_in     = node.css('td[4]').inner_text
            rest_out    = node.css('td[5]').inner_text
            
            csv << [number,date,work_in,work_out,rest_in,rest_out]
        end       
    end
end


