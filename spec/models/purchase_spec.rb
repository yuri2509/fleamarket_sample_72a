require 'rails_helper'

describe Purchase do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        user = create(:user)
        item = create(:item)
        purchase = build(:purchase, user_id: user.id, item_id: item.id)
        expect(purchase).to be_vaild
      end
    end
    context '無効なテスト' do
    end
  end
end