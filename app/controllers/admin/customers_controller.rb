class Admin::CustomersController < ApplicationController
layout 'top'
  def show
    @customer = Customer.find(params[:id])

  end

def index
  @customers = Customer.all.page(params[:page])
end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(Customer_params)
    flash[:notice] = "You have updated Customer successfully."
    redirect_to customer_path(current_Customer)
    else
    render 'edit'
    end

  end
  private

  def customer_params
    params.require(:Customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana ,:postal_code ,:address ,:telephone_number)
  end
end