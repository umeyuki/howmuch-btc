class HomeController < ApplicationController
  def index
    @xrp_price = Rails.cache.fetch("xrp_price", expires_in: 3.minutes ) do
      res = HTTP.get("https://coincheck.com/api/rate/xrp_jpy")
      JSON.parse(res.body)["rate"].to_f.round.to_s(:delimited)
    end

    @bitcoin_price = Rails.cache.fetch("bitcoin_price", expires_in: 3.minutes ) do
      res = HTTP.get("https://coincheck.com/api/ticker")
      JSON.parse(res.body)["last"].round.to_s(:delimited)
    end
  end
end
