class HomeController < ApplicationController
	# GET /invitations
  # GET /invitations.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitations }
    end
  end


end
