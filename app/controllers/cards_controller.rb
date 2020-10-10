class CardsController < ApplicationController
  before_action :get_card_information, only: [:index, :destroy, :buy_confirm, :purchase]
  before_action :refer_to_payjp, only: [:create, :destroy, :purchase]
  before_action :get_item_information, only: [:buy_confirm, :purchase]

  require "payjp"

  # マイページ内、登録済みのカード表示
  def index
    if @card.present?
      refer_to_payjp
      @customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card = @customer.cards.retrieve(@card.card_id)
    else
      redirect_to new_card_path
    end
  end

  # マイページ内、カード新規登録画面
  def new
  end

  # マイページ内、カード登録機能
  def create

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

  # マイページ内、カード削除機能
  def destroy

    customer = Payjp::Customer.retrieve(@card.customer_id)
    
    customer.delete
    @card.destroy

    redirect_to new_card_path
  end



  # 購入確認画面
  def buy_confirm
    @image = @item.item_images.first

    # カード未登録の場合は新規登録画面に遷移
    if @card.blank?
      redirect_to new_card_path
    else
      refer_to_payjp
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card = customer.cards.retrieve(@card.card_id)
    end
  end

  # 購入機能
  def purchase

    # 決済
    Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
    )

    # purchaser_idに購入者idを登録
    @item.update(purchaser_id: current_user.id)
    redirect_to root_path
  end

  private
  def get_item_information
    @item = Item.includes(:item_images).find(params[:id])
  end


  def get_card_information
    @card = Card.where(user_id: current_user.id).first
  end

  def refer_to_payjp
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
  end

end
