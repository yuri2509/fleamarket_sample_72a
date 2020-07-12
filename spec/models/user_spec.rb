require 'rails_helper'
require 'support/factory_bot'

describe User do
  describe '#create' do
    context "有効なテスト" do
      it "全て入力すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context "無効なテスト" do
      it "ニックネームの未入力" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include('を入力してください')
      end

      it 'メールアドレスの未入力' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'メールアドレスの重複' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include('はすでに存在します')
      end

      it 'パスワードの未入力' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it '6文字以下のパスワード' do
        user = build(:user, password: '000000', password_confirmation: '000000')
        user.valid?
        expect(user.errors[:password]).to include('は7文字以上で入力してください')
      end

      it '確認用パスワードの未入力' do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include('を入力してください')
      end

      it '確認用パスワードの不一致' do
        user = build(:user, password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
      end

      it 'ユーザー本名(苗字)の未入力' do
        user = build(:user, family_name: nil)
        user.valid?
        expect(user.errors[:family_name]).to include('を入力してください')
      end

      it 'ユーザー本名(苗字)の不正値入力' do
        user = build(:user, family_name: "ﾔﾏﾀﾞ")
        user.valid?
        expect(user.errors[:family_name]).to include('を全角で入力してください')
      end

      it 'ユーザー本名(名前)の未入力' do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include('を入力してください')
      end

      it 'ユーザー本名(名前)の不正値入力' do
        user = build(:user, first_name: "ﾀﾛｳ")
        user.valid?
        expect(user.errors[:first_name]).to include('を全角で入力してください')
      end

      it 'ユーザー本名(苗字カナ)の未入力' do
        user = build(:user, family_name_reading: nil)
        user.valid?
        expect(user.errors[:family_name_reading]).to include('を入力してください')
      end

      it 'ユーザー本名(苗字カナ)の不正値入力' do
        user = build(:user, family_name_reading: "やまだ")
        user.valid?
        expect(user.errors[:family_name_reading]).to include('を全角カタカナで入力してください')
      end

      it 'ユーザー本名(名前カナ)の未入力' do
        user = build(:user, first_name_reading: nil)
        user.valid?
        expect(user.errors[:first_name_reading]).to include('を入力してください')
      end

      it 'ユーザー本名(名前カナ)の不正値入力' do
        user = build(:user, first_name_reading: "たろう")
        user.valid?
        expect(user.errors[:first_name_reading]).to include('を全角カタカナで入力してください')
      end

      it '生年月日の未入力' do
        user = build(:user, birth_day: nil)
        user.valid?
        expect(user.errors[:birth_day]).to include('を入力してください')
      end
    end
  end
end