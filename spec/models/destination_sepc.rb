require 'rails_helper'
require 'support/factory_bot'

describe Destination do
  context "有効なテスト" do
    it "全て入力すれば登録できること" do
      destination = build(:destination)
      expect(destination).to be_valid
    end

    it "建物名の未入力" do
      destination = build(:destination, building_name: nil)
      expect(destination).to be_valid
    end

    it '電話番号の未入力' do
      destination = build(:destination, phone_number: nil)
      expect(destination).to be_valid
    end
  end

  context "無効なテスト" do
    it '送付先氏名(苗字)の未入力' do
      destination = build(:destination, family_name: nil)
      destination.valid?
      expect(destination.errors[:family_name]).to include('を入力してください')
    end

    it '送付先氏名(苗字)の不正値入力' do
      destination = build(:destination, family_name: "ﾔﾏﾀﾞ")
      destination.valid?
      expect(destination.errors[:family_name]).to include('を全角で入力してください')
    end

    it '送付先氏名(名前)の未入力' do
      destination = build(:destination, first_name: nil)
      destination.valid?
      expect(destination.errors[:first_name]).to include('を入力してください')
    end

    it '送付先氏名(名前)の不正値入力' do
      destination = build(:destination, first_name: "ﾀﾛｳ")
      destination.valid?
      expect(destination.errors[:first_name]).to include('を全角で入力してください')
    end

    it '送付先氏名(苗字カナ)の未入力' do
      destination = build(:destination, family_name_reading: nil)
      destination.valid?
      expect(destination.errors[:family_name_reading]).to include('を入力してください')
    end

    it '送付先氏名(苗字カナ)の不正値入力' do
      destination = build(:destination, family_name_reading: "やまだ")
      destination.valid?
      expect(destination.errors[:family_name_reading]).to include('を全角カタカナで入力してください')
    end

    it '送付先氏名(名前カナ)の未入力' do
      destination = build(:destination, first_name_reading: nil)
      destination.valid?
      expect(destination.errors[:first_name_reading]).to include('を入力してください')
    end

    it '送付先氏名(名前カナ)の不正値入力' do
      destination = build(:destination, first_name_reading: "たろう")
      destination.valid?
      expect(destination.errors[:first_name_reading]).to include('を全角カタカナで入力してください')
    end

    it '郵便番号の未入力' do
      destination = build(:destination, post_code: nil)
      destination.valid?
      expect(destination.errors[:post_code]).to include('を入力してください')
    end

    it 'ハイフン有りの郵便番号の未入力' do
      destination = build(:destination, post_code: "000-0000")
      destination.valid?
      expect(destination.errors[:post_code]).to include('をハイフン(-)無しで７桁の半角数字で入力してください')
    end

    it '都道府県の未入力' do
      destination = build(:destination, prefecture: nil)
      destination.valid?
      expect(destination.errors[:prefecture]).to include('を入力してください')
    end

    it '市区町村の未入力' do
      destination = build(:destination, city: nil)
      destination.valid?
      expect(destination.errors[:city]).to include('を入力してください')
    end

    it '番地の未入力' do
      destination = build(:destination, address: nil)
      destination.valid?
      expect(destination.errors[:address]).to include('を入力してください')
    end
  end
end