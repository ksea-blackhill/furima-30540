class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: :index

  def index
    if @item.payment.nil?
      @form = Form.new
    else
      redirect_to root_path
    end
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path(@form)
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :area_id, :municipality, :banchi, :building, :tel, :payment_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    redirect_to root_path if current_user == @item.user || @item.payment
  end
end
