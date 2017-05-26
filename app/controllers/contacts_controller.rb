class ContactsController < ApplicationController
#  def index
#  end

  def new
 #   @contact = Contact.new
   if params[:back]
     @contact = Contact.new(contacts_params)
   else
     @contact = Contact.new
   end
  end

  def create
    #Contact.create(contacts_params)
    @contact = Contact.new(contacts_params)
    if @contact.save
      # redirect_to contacts_path, notice:"お問い合わせありがとうございました"
      redirect_to root_path, notice:"お問い合わせが完了しました！"
    else
       render 'new'
    end  
  end
  
  def update
     @contact.find(params[:id])
     @contact.update(blogs_params)
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
   private 
    def contacts_params
      params.require(:contact).permit(:name, :content, :email)
    end
end