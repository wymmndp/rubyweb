class UsersController < ApplicationController
    before_action :_header  
    def _header
      @danhmucs = Danhmuc.all
    end

    def index
        @games = Game.limit(12).all 
        @gamesrandom = Game.limit(12).order("RAND()")
    end

    def gameincategory
      @category = Danhmuc.detailCategory(params[:idcategory])
      @games = Game.getGamesInCategory(params[:idcategory])
    end

    def game 
      @game = Game.find(params[:id])
      
    end 

    def viewsearch
      @games = Game.searchGame(params[:namegame],0,0)
    end

    def playgame
      @game = Game.find(params[:id])
    end

    def new
      @user = User.new
    end
  
    def create
      @user = User.new user_params
      if @user.save
        flash[:success] = "Register success"
        redirect_to "/login"
      else
        flash[:success] = "Register failed"
        render :new
      end
    end
  
    private
    def user_params
      params.require(:user).permit :name, :password, :password_confirmation
    end

   
end
