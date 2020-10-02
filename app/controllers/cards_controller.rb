class CardsController < ApplicationController

  def new
  end

  def create

    # Pay.jpとの通信
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]

    # 顧客IDの生成
    customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )

    # アプリ内DBにデータ保存
    @card = Card.new(
      user_id: current_user.id,
      customer_id: customer.id,
      card_id: customer.default_card
    )
    @card.save

    redirect_to root_path
  end

  def edit
  end

  def update
  end
end
