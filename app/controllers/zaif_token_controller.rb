class ZaifTokenController < ApplicationController
  def index
    @bitcoin_price = Rails.cache.fetch("bitcoin_price", expires_in: 3.minutes ) do
      res = HTTP.get("https://coincheck.com/api/ticker")
      JSON.parse(res.body)["last_price"]
      JSON.parse(res.body)["last"].round.to_s(:delimited)
    end

    @zaiftoken_price = Rails.cache.fetch("zaiftoken_price", expires_in: 3.minutes ) do
      res = HTTP.get("https://api.zaif.jp/api/1/last_price/zaif_jpy")
      JSON.parse(res.body)["last_price"]
    end
  end
end
