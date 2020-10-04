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
    @item = Item.includes(:item_images).find(params[:id])
    @image = @item.item_images.first

    card = Card.where(user_id: current_user.id).first

    if card.blank?
      redirect_to new_card_path
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)
    end
  end

  def purchase
    card = Card.where(user_id: current_user.id).first
    item = Item.includes(:item_images).find(params[:id])
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]

    Payjp::Charge.create(
      amount: item.price,
      customer: card.customer_id,
      currency: 'jpy'
    )

    item.update(purchaser_id: current_user.id)
    redirect_to root_path
  end

end
