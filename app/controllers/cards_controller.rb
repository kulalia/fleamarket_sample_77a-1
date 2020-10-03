class CardsController < ApplicationController

  require "payjp"

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)
    end
  end

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

    redirect_to cards_path
  end

  def destroy
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.destroy
    redirect_to new_card_path
  end

  def buy_comfirm
  end

  def purchase
    redirect_to root_path
  end

end
