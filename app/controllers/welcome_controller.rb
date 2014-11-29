class WelcomeController < ApplicationController

  def index
    @familia = Familia.all
    @membro = User.new
  end

  def create
    @membro = User.create(user_params)
    @friend = Familia.order("RANDOM()").first


    if @friend.name == @membro.name
      render :create      
    else
      @membro.friend = @friend.name
      if @membro.save

        Familia.find_by_name(@membro.friend).delete
        redirect_to show_path(@membro.id)
      else
        redirect_to root_path
      end  
    end

  end

  def delete
    @membro = User.find params[:id]
    @membro.delete

    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation,
      :friend
    )
  end

end