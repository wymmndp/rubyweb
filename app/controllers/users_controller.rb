class UsersController < ApplicationController
    before_action :_header  
   
    def _header
      @danhmucs = Danhmuc.all
    end

    def index
        @games = Game.limit(12).all 
        @gamesrandom = Game.limit(12).order("RAND()")
    end

    def detailuser
        @user = User.where("name = ?",session[:user_id]).first
    end

    # gameincategory
    def gameincategory
      @category = Danhmuc.detailCategory(params[:idcategory])
      @games = Game.getGamesInCategory(params[:idcategory]).paginate(page: params[:page],per_page: 12)
    end

    def game 
      @game = Game.find(params[:id])
      @havegame = Gamehaving.where("name = ? and idgame = ?",session[:user_id],params[:id]).count
    end 

    #search
    def viewsearch
      @games = Game.searchGame(params[:namesearch],params[:mincoin],params[:maxcoin]).paginate(page: params[:page],per_page: 12)
    end

  
    #play 
    def playgame
      @game = Game.find(params[:id])
    end

    def new
      @user = User.new
    end
  
    
    
    #cart
    def addGameToCart
      Preinvoice.addGameToCart(session[:user_id],params[:id])
    end

    def loadPreinvoice
      @preinvoices = Preinvoice.getPreinvoice(params[:username])
      render json: {
        preinvoices: @preinvoices
      }
    end

    def loadCoin
      @mycoin = User.select(:coinhave).where("name = ?",params[:username])
      @totalcoin = Preinvoice.select(:coin).joins("inner join games on games.id = preinvoices.idgame").where("username = ?",params[:username])
      render json: {
        mycoin: @mycoin,
        totalcoin: @totalcoin
      }
    end

    def removeGameFromCart
     @preinvoices = Preinvoice.removeItem(params[:username],params[:id])
    end

    def buy
      Gamehaving.addGame(params[:username],params[:id])
      @user = User.where("name = ?",params[:username]).update(coinhave: params[:coinreturn])
    end


    # register

    def create
      @user = User.new user_params
      @user.coinhave = 999999999
      @user.allcoin = 999999999
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
