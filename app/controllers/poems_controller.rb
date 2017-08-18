class PoemsController < ApplicationController
 def index
  @poems = Poem.all
 end
 
 def show
  #@poems = Poem.all
  #binding.pry
   @poem =Poem.find(params[:id])
  # redirect_to poem_path
 end

#  private
 #  def poems_params
#       params.require(:poem).permit(:title, :content)
#   end
end
