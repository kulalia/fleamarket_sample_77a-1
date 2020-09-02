require 'rails_helper'

describe UserProfile do
  describe '#create' do
    let(:user) { create(:user) }

      it "全てのカラムに値があれば登録できること" do
        user_profile = build(:user_profile, user_id: user.id)
        expect(user_profile).to be_valid
      end

      it "first_nameがない場合は登録できないこと" do
        user_profile = build(:user_profile, user_id: user.id, first_name: nil)
        user_profile.valid?
        expect(user_profile.errors[:first_name]).to include("を入力してください")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user_profile = build(:user_profile, user_id: user.id, first_name_kana: nil)
        user_profile.valid?
        expect(user_profile.errors[:first_name_kana]).to include("を入力してください")
      end

      it "family_nameがない場合は登録できないこと" do
        user_profile = build(:user_profile, user_id: user.id, family_name: nil)
        user_profile.valid?
        expect(user_profile.errors[:family_name]).to include("を入力してください")
      end
    
      it "family_name_kanaがない場合は登録できないこと" do
        user_profile = build(:user_profile, user_id: user.id, family_name_kana: nil)
        user_profile.valid?
        expect(user_profile.errors[:family_name_kana]).to include("を入力してください")
      end

      it "birthdayがない場合は登録できないこと" do
        user_profile = build(:user_profile, user_id: user.id, birthday: nil)
        user_profile.valid?
        expect(user_profile.errors[:birthday]).to include("を入力してください")
      end

      context "first_nameのバリデーションが機能していること" do
        it "全角であれば登録できること" do
          user_profile = build(:user_profile, user_id: user.id)
          expect(user_profile).to be_valid
        end

        it "全角でなければ登録できないこと" do
          user_profile = build(:user_profile, user_id: user.id, first_name: "namae")
          user_profile.valid?
          expect(user_profile.errors[:first_name]).to include("は不正な値です")
        end
      end

      context "family_nameのバリデーションが機能していること" do
        it "全角であれば登録できること" do
          user_profile = build(:user_profile, user_id: user.id)
          expect(user_profile).to be_valid
        end

        it "全角でなければ登録できないこと" do
          user_profile = build(:user_profile, user_id: user.id, family_name: "myoji")
          user_profile.valid?
          expect(user_profile.errors[:family_name]).to include("は不正な値です")
        end
      end

      context "first_name_kanaのバリデーションが機能していること" do
        it "全角ひらがなであれば登録できること" do
          user_profile = build(:user_profile, user_id: user.id)
          expect(user_profile).to be_valid
        end

        it "全角ひらがなでなければ登録できないこと" do
          user_profile = build(:user_profile, user_id: user.id, first_name_kana: "ナマエ")
          user_profile.valid?
          expect(user_profile.errors[:first_name_kana]).to include("は不正な値です")
        end
      end

      context "family_name_kanaのバリデーションが機能していること" do
        it "全角ひらがなであれば登録できること" do
          user_profile = build(:user_profile, user_id: user.id)
          expect(user_profile).to be_valid
        end

        it "全角ひらがなでなければ登録できないこと" do
          user_profile = build(:user_profile, user_id: user.id, family_name_kana: "ミョウジ")
          user_profile.valid?
          expect(user_profile.errors[:family_name_kana]).to include("は不正な値です")
        end
      end
  end
end