class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new
    @card = Card.new
    # redirect_to action: "index" if @card.present?
  end

  def create
    Payjp.api_key = 'sk_test_1be3aacbcbcc41ba0aaf616c'

    if params['payjpToken'].blank?
      render "new", error: 'クレジットカードを登録してください'
    else
      customer = Payjp::Customer.create(
        description: 'test', 
        email: current_user.email,
        card: params["payjp-token"],
        metadata: {user_id: current_user.id }
      )
      @card =  Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path
      else
        render "new", error: 'クレジットカード情報が正しくありません'
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
