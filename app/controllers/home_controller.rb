class HomeController < ApplicationController
  def index
    @bitcoin_price = Rails.cache.fetch("bitcoin_price", expires_in: 3.minutes ) do
      res = HTTP.get("https://coincheck.com/api/ticker")
      JSON.parse(res.body)["last_price"]
      JSON.parse(res.body)["last"].round.to_s(:delimited)
    end
  end
end
