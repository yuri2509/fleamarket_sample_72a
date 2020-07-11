require 'rails_helper'

describe User do
  describe '#create' do
    context "有効なテスト" do
      it "全て入力すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end

      it ""