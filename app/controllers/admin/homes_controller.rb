class Admin::HomesController < ApplicationController
layout 'top'
def top
    @orders = Order.all
end
end