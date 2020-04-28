class ItemsController < ApplicationController
  def new
  end

  def create
     @item = @ranking.items.build
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
