require 'rails_helper'

describe Purchase do

  context '有効なテスト' do
    it '全項目の入力' do
      purchase = build(:purchase)
      expect(purchase).to be_valid
    end
  end
  context '無効なテスト' do
    it 'ユーザーがログインしていない' do
      purchase = build(:purchase, user_id: nil)
      purchase.valid?
      expect(purchase.errors[:user_id]).to include()
    end
    it '商品が存在しない' do
      purchase = build(:purchase, item_id: nil)
      purchase.valid?
      expect(purchase.errors[:item_id]).to include()
    end
  end
end