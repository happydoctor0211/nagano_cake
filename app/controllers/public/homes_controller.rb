class Public::HomesController < ApplicationController

  def top
    #https://qiita.com/potterqaz/items/4529547e232b587e3dd6を参照
    @items = Item.limit(4).order(" created_at DESC ")
  end

  def about
  end

end
