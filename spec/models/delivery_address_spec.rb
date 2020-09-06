require 'rails_helper'

describe DeliveryAddress do
  describe '#create' do
    let(:user) { create(:user) }

      it "全てのカラムに値があれば登録できること" do
        delivery_address = build(:delivery_address, user_id: user.id)
        expect(delivery_address).to be_valid
      end

      it "buildingがなくても登録できること" do
        delivery_address = build(:delivery_address, user_id: user.id, building: nil)
        expect(delivery_address).to be_valid
      end

      it "phone_numberがなくても登録できること" do
        delivery_address = build(:delivery_address, user_id: user.id, phone_number: nil)
        expect(delivery_address).to be_valid
      end

      it "first_nameがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, first_name: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:first_name]).to include("を入力してください")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, first_name_kana: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:first_name_kana]).to include("を入力してください")
      end

      it "family_nameがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, family_name: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:family_name]).to include("を入力してください")
      end

      it "family_name_kanaがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, family_name_kana: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:family_name_kana]).to include("を入力してください")
      end

      it "postal_codeがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, postal_code: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:postal_code]).to include("を入力してください")
      end

      it "prefecture_idがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, prefecture_id: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:prefecture_id]).to include("を入力してください")
      end

      it "cityがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, city: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:city]).to include("を入力してください")
      end

      it "addressがない場合は登録できないこと" do
        delivery_address = build(:delivery_address, user_id: user.id, address: nil)
        delivery_address.valid?
        expect(delivery_address.errors[:address]).to include("を入力してください")
      end

      context "first_nameのバリデーションが機能していること" do
        it "全角であれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id)
          expect(delivery_address).to be_valid
        end

        it "全角でなければ登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, first_name: "namae")
          delivery_address.valid?
          expect(delivery_address.errors[:first_name]).to include("は不正な値です")
        end
      end

      context "family_nameのバリデーションが機能していること" do
        it "全角であれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id)
          expect(delivery_address).to be_valid
        end

        it "全角でなければ登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, family_name: "myoji")
          delivery_address.valid?
          expect(delivery_address.errors[:family_name]).to include("は不正な値です")
        end
      end

      context "first_name_kanaのバリデーションが機能していること" do
        it "全角ひらがなであれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id)
          expect(delivery_address).to be_valid
        end

        it "全角ひらがなでなければ登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, first_name_kana: "ナマエ")
          delivery_address.valid?
          expect(delivery_address.errors[:first_name_kana]).to include("は不正な値です")
        end
      end

      context "family_name_kanaのバリデーションが機能していること" do
        it "全角ひらがなであれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id)
          expect(delivery_address).to be_valid
        end

        it "全角ひらがなでなければ登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, family_name_kana: "ミョウジ")
          delivery_address.valid?
          expect(delivery_address.errors[:family_name_kana]).to include("は不正な値です")
        end
      end

      context "postal_codeのバリデーションが機能していること" do
        it "7桁であれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id)
          expect(delivery_address).to be_valid
        end

        it "6桁以下だと登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, postal_code: "123456")
          delivery_address.valid?
          expect(delivery_address.errors[:postal_code]).to include("は不正な値です")
        end

        it "8桁以上だと登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, postal_code: "12345678")
          delivery_address.valid?
          expect(delivery_address.errors[:postal_code]).to include("は不正な値です")
        end
      end

      context "phone_numberのバリデーションが機能していること" do
        it "10桁であれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id)
          expect(delivery_address).to be_valid
        end

        it "11桁であれば登録できること" do
          delivery_address = build(:delivery_address, user_id: user.id, phone_number: "12345678901")
          expect(delivery_address).to be_valid
        end

        it "9桁以下であれば登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, phone_number: "123456789")
          delivery_address.valid?
          expect(delivery_address.errors[:phone_number]).to include("は不正な値です")
        end

        it "12桁以上であれば登録できないこと" do
          delivery_address = build(:delivery_address, user_id: user.id, phone_number: "123456789012")
          delivery_address.valid?
          expect(delivery_address.errors[:phone_number]).to include("は不正な値です")
        end
      end
  end
end