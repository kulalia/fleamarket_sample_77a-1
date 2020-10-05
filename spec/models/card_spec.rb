require 'rails_helper'

describe Card do
  describe '#create' do
    it "user, customer_id, card_idがあれば登録できること" do
      card = build(:card)
      expect(card).to be_valid
    end

    it "userがない場合は登録できないこと" do
      card = build(:card, user: nil)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end

    it "customer_idがない場合は登録できないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがない場合は登録できないこと" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
