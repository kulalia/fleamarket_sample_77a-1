require 'rails_helper'

describe User do
  describe '#create' do
    it "nickname, email, password, password_confirmationがあれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    context "passwordのバリデーションが機能していること" do
      it "passwordが7文字以上であれば登録できること" do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        expect(user).to be_valid
      end

      it "passwordが6文字以下であれば登録できないこと" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end
    end

    context "emailのバリデーションが機能していること" do
      it "@とドメインがあれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "@がない登録できないこと" do
        user = build(:user, email: "test.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "ドメインがないと登録できないこと" do
        user = build(:user, email: "test@")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
  
      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
    end
  end
end

