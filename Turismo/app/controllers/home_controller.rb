class HomeController < ApplicationController
  
  #GET /home
  def index
  	render :index
  end

  #GET /home/new
  def new
  	@Account = Account.new	
  end 

  #POST /home
  def create
  	flash[:notice] = "entre al def create"
  	#@Account = Account.new(Correo: params[:Account][:Correo], Contraseña: params[:Acconut][:Contraseña])
  	#if @Account.save
  	#	flash[:notice] = "e capturado los datos correctamente"
  	#	redirect_to action: 'new'
  	#else
  	#	flash[:notice] = " no e capturado los datos correctamente"
  	#	render :new
  	#end
  end
 end
