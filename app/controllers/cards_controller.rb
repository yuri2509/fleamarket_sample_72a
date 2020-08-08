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
      redirect_to action: "new", error: 'クレジットカードを登録してください'
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params["payjp-token"],
        metadata: {user_id: current_user.id }
      )
      @card =  Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show", id: current_user.id
      else
        render "new", error: 'クレジットカード情報が正しくありません'
      end
    end
  end

  def show
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_1be3aacbcbcc41ba0aaf616c'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy
    @card = Card.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_1be3aacbcbcc41ba0aaf616c'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
      if @card.destroy
        
      else
        redirect_to card_path(current_user.id), error: "削除できませんでした。"
      end
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
