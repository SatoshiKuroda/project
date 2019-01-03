require 'nokogiri'
require 'anemone'
require 'open-uri'
require 'csv'

uri = 'http://stg.work.dh-manager.jp/shift/send_application/time_record_view/staff_no/'
req = Net::HTTP::Get.new(uri)
req.basic_auth 'stg','0zUtEJX1w4Ex'
Anemone.crawl(URI::HTTP.build(host: 'stg.work.dh-manager.jp',path: '/shift/send_application/time_record_view/staff_no/',userinfo: 'stg:0zUtEJX1w4Ex'),depth_limit: 1) do |anemone|
  pattern = %r[\d+]
  anemone.on_pages_like(pattern) do |page|
    puts page.url
  #anemone.on_every_page do |page|
  #  puts page.body
  #end
  end
end
  #res = Net::HTTP.start(uri.hostname,uri.port,) do |http|
#  http.request(req)
#end
#p res.body