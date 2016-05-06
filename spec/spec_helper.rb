require 'bundler/setup'
Bundler.setup

require "geo_locale"
require "pry"

RSpec.configure do |config|
  LV_IPS =["81.198.65.13", "85.9.209.244", "83.241.46.175", "78.84.147.188", "159.148.168.103"]
  LT_IPS =["77.79.35.98", "158.129.84.6", "91.211.246.238"]
  EE_IPS =["188.92.162.172", "46.36.219.51", "84.50.44.25"]
  RU_IPS =["92.255.197.224", "213.85.92.10", "80.78.245.89"]
  US_IPS =["97.77.25.20", "192.185.83.90", "199.180.150.25"]
  GB_IPS =["78.157.209.36", "79.143.87.234", "195.40.6.43"]
  IR_IPS =["77.104.75.76", "94.74.132.65"]
  IE_IPS =["54.170.245.171", "54.171.4.57", "176.34.86.253"]
  PL_IPS =["83.3.115.58", "109.207.54.81", "88.199.29.50"]

  XX_CLOUDFLARE_REQUEST_HEADERS = {
    "rack.version"=>[1, 3],
    "rack.errors"=>"",
    "rack.multithread"=>false,
    "rack.multiprocess"=>false,
    "rack.run_once"=>false,
    "SCRIPT_NAME"=>"",
    "QUERY_STRING"=>"pp=flamegraph",
    "SERVER_PROTOCOL"=>"HTTP/1.1",
    "SERVER_SOFTWARE"=>"2.13.4",
    "GATEWAY_INTERFACE"=>"CGI/1.2",
    "REQUEST_METHOD"=>"GET",
    "REQUEST_PATH"=>"/lv/lv/p/k2/landing",
    "REQUEST_URI"=>"/lv/lv/p/k2/landing?pp=flamegraph",
    "HTTP_VERSION"=>"HTTP/1.1",
    "HTTP_HOST"=>"localhost:3000",
    "HTTP_USER_AGENT"=> "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:43.0) Gecko/20100101 Firefox/43.0",
    "HTTP_ACCEPT"=> "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.5",
    "HTTP_ACCEPT_ENCODING"=>"gzip, deflate",
    "HTTP_CONNECTION"=>"keep-alive",
    "HTTP_CACHE_CONTROL"=>"max-age=0",
    "SERVER_NAME"=>"localhost",
    "SERVER_PORT"=>"3000",
    "PATH_INFO"=>"/lv/lv/p/k2/landing",
    "REMOTE_ADDR"=>"::1",
    "puma.socket"=>"",
    "rack.hijack?"=>true,
    "rack.hijack"=>"",
    "rack.input"=>"",
    "rack.url_scheme"=>"http",
    "rack.after_reply"=>[],
    "ORIGINAL_FULLPATH"=>"/lv/lv/p/k2/landing?pp=flamegraph",
    "ORIGINAL_SCRIPT_NAME"=>"",
    "HTTP_CF_IPCOUNTRY"=>"XX"
  }

  LV_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  LT_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  EE_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  RU_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  US_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  GB_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  IR_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  IE_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone
  PL_CLOUDFLARE_REQUEST_HEADERS = XX_CLOUDFLARE_REQUEST_HEADERS.clone

  LV_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "LV"
  LT_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "LT"
  EE_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "EE"
  RU_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "RU"
  US_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "US"
  GB_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "GB"
  IR_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "IR"
  IE_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "IE"
  PL_CLOUDFLARE_REQUEST_HEADERS["HTTP_CF_IPCOUNTRY"] = "PL"
end
