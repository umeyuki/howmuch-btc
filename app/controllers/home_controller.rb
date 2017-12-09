class HomeController < ApplicationController
  def index
    # zaif api から最新の価格を取得
    # 3分置きにキャッシュを更新
    res = HTTP.get("https://coincheck.com/api/ticker")
    @bitcoin_price = JSON.parse(res.body)["last"].round.to_s(:delimited)
  end
end
