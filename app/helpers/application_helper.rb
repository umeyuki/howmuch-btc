module ApplicationHelper
  def price
    case controller_name
    when "bitcoin"
      @bitcoin_price
    when "xrp"
      @xrp_price
    when "zaif_token"
      @zaiftoken_price
    end
  end
end
