require 'rails_helper'

describe Card do
  describe '#create' do
    context '有効なテスト' do
      it '全項目の入力' do
        card = build(:card)
        expect(card).to be_valid
      end
    end

    context '無効なテスト' do
      it 'payjpのcard_idの未設定' do
        card = build(:card, card_id: nil)
        card.valid?
        expect(card.errors[:card_id]).to include('を入力してください')
      end
      it 'payjpのcustomer_idの未設定' do
        card = build(:card, customer_id: nil)
        card.valid?
        expect(card.errors[:customer_id]).to include('を入力してください')
      end
    end
  end
end
