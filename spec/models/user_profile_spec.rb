require 'rails_helper'

describe UserProfile do
  describe '#create' do
    it "first_name,first_name_kana,family_name,family_name_kana,birthdayがあれば登録できること" do
      user = create(:user)
      user_profile = build(:user_profile, user_id: user.id)
      expect(user_profile).to be_valid
    end

    it "first_nameがない場合は登録できないこと" do
      user = create(:user)
      user_profile = build(:user_profile, user_id: user.id, first_name: nil)
      user_profile.valid?
      expect(user_profile.errors[:first_name]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = create(:user)
      user_profile = build(:user_profile, user_id: user.id, first_name_kana: nil)
      user_profile.valid?
      expect(user_profile.errors[:first_name_kana]).to include("を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      user = create(:user)
      user_profile = build(:user_profile, user_id: user.id, family_name: nil)
      user_profile.valid?
      expect(user_profile.errors[:family_name]).to include("を入力してください")
    end
    
    it "family_name_kanaがない場合は登録できないこと" do
      user = create(:user)
      user_profile = build(:user_profile, user_id: user.id, family_name_kana: nil)
      user_profile.valid?
      expect(user_profile.errors[:family_name_kana]).to include("を入力してください")
    end

    it "birthdayがない場合は登録できないこと" do
      user = create(:user)
      user_profile = build(:user_profile, user_id: user.id, birthday: nil)
      user_profile.valid?
      expect(user_profile.errors[:birthday]).to include("を入力してください")
    end

  end
end