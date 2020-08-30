require 'rails_helper'

describe DeliveryAddress do
  describe '#create' do
    it "first_name,first_name_kana,family_name,family_name_kana,postal_code,prefecture_id,city,address,building, phone_numberがあれば登録できること" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id)
      expect(delivery_address).to be_valid
    end

    it "buildingがなくても登録できること" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, building: nil)
      expect(delivery_address).to be_valid
    end

    it "phone_numberがなくても登録できること" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, phone_number: nil)
      expect(delivery_address).to be_valid
    end

    it "first_nameがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, first_name: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:first_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, first_name_kana: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, family_name: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:family_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, family_name_kana: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:family_name_kana]).to include("を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, postal_code: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:postal_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, prefecture_id: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, city: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      user = create(:user)
      delivery_address = build(:delivery_address, user_id: user.id, address: nil)
      delivery_address.valid?
      expect(delivery_address.errors[:address]).to include("を入力してください")
    end
  end
end