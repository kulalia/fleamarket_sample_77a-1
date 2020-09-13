FactoryBot.define do
  factory :item do
    user_id             {1}
    name                {"商品名"}
    category_id         {"1"}
    detail              {"詳細"}
    brand               {"ブランド"}
    price               {50000}
    item_status         {"新品"}
    prefecture_id       {"1"}
    days_until_shipping {"2日"}
    shipping_fee        {"自己負担"}
    sale_or_sold        {"在庫あり"}
  end
end
