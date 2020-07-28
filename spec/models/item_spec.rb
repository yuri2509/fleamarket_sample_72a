require 'rails_helper'
require 'support/factory_bot'

describe Item do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        item = build(:item)
        expect(item).to be_valid
      end
      it 'ブランドが入力されていない' do
        item = build(:item, brand: nil)
        expect(item).to be_valid
      end
    end
    context '無効なテスト' do
      it '画像が選択されていない' do
        item = build(:item)
        item.images = []
        item.valid?
        expect(item.errors[:images]).to include('を最低1枚選択してください')
      end
      it '商品名が入力されていない' do
        item = build(:item, name: nil)
        item.images.new
        item.valid?
        expect(item.errors[:name]).to include('を入力してください')
      end
      it '商品説明が入力されていない' do
        item = build(:item, description: nil)
        item.images.new
        item.valid?
        expect(item.errors[:description]).to include('を入力してください')
      end
      it '値段が入力されていない' do
        item = build(:item, price: nil)
        item.images.new
        item.valid?
        expect(item.errors[:price]).to include('は半角数字を入力してください')
      end
      it '値段が半角数字でない' do
        item = build(:item, price: "あ")
        item.images.new
        item.valid?
        expect(item.errors[:price]).to include('は半角数字を入力してください')
      end
      it '値段が299円以下' do
        item = build(:item, price: 299)
        item.images.new
        item.valid?
        expect(item.errors[:price]).to include('は300円以上にしてください')
      end
      it '値段が10000000円以上' do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include('は9,999,999円以下にしてください')
      end
      it '商品の状態が選択されていない(初期値)' do
        item = build(:item, status: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:status]).to include('を選択してください')
      end
      it '配送地域が選択されていない(初期値)' do
        item = build(:item, prefecture_id: "選択してください")
        item.images.new
        item.prefecture_id = nil
        item.valid?
        expect(item.errors[:prefecture_id]).to include('を入力してください')
      end
      it '配送日数が選択されていない(初期値)' do
        item = build(:item, day: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:day]).to include('を選択してください')
      end
      it '配送料が選択されていない(初期値)' do
        item = build(:item, cost: "選択してください")
        item.images.new
        item.valid?
        expect(item.errors[:cost]).to include('を選択してください')
      end
      it '商品の状態が選択されていない(nil)' do
        item = build(:item, status: nil)
        item.images.new
        item.valid?
        expect(item.errors[:status]).to include('を入力してください')
      end
      it '配送地域が選択されていない(nil)' do
        item = build(:item, prefecture_id: nil)
        item.images.new
        item.valid?
        expect(item.errors[:prefecture_id]).to include('を入力してください')
      end
      it '配送日数が選択されていない(nil)' do
        item = build(:item, day: nil)
        item.images.new
        item.valid?
        expect(item.errors[:day]).to include('を入力してください')
      end
      it '配送料が選択されていない(nil)' do
        item = build(:item, cost: nil)
        item.images.new
        item.valid?
        expect(item.errors[:cost]).to include('を入力してください')
      end
    end
  end
end