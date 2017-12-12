class HomeController < ApplicationController
  def index
    @zaiftoken_price = Rails.cache.fetch("zaiftoken_price", expires_in: 3.minutes ) do
      res = HTTP.get("https://api.zaif.jp/api/1/last_price/zaif_jpy")
      JSON.parse(res.body)["last_price"]
    end
  end
end
