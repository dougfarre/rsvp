class InvitationsController < ApplicationController
	helper_method :sort_column, :sort_direction
  # GET /invitations
  # GET /invitations.json
  def index
		if admin_signed_in?
			redirect_to admin_index_path
			return
		end

		if session[:is_authenticated] 
			@invitation = Invitation.find(session[:invitation_id])
			
			if @invitation.address.blank?
				@invitation.build_address
			end
		else
			session[:is_authenticated] = false
			session[:invitation_id] = nil
			redirect_to new_user_registration_path	
		end
  end
		
	def admin_index
		if !admin_signed_in?
			redirect_to root_path
			return
		end

		@invitations = Invitation.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 2, :page => params[:page])
		@new_invitation = Invitation.new
		@reports = Invitation.get_reports

	end
	
  # GET /invitations/1
  # GET /invitations/1.json
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.json
  def new
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
		if !admin_signed_in?
			redirect_to root_path
			return
		end

    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.json
  def create
		if !admin_signed_in?
			redirect_to root_path
			return
		end

    @invitation = Invitation.new(params[:invitation])
		@invitation.admin_id = current_admin.id

    if @invitation.save
     	redirect_to admin_index_path, notice: 'Invitation was successfully created.' 
   	else
    	redirect_to admin_index_path, notice: @invitation.make_errors 
   	end
  end

  # PUT /invitations/1
  # PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])

		if admin_signed_in?
			@invitation.attributes = params[:invitation] 
			@invitation.change_address(params[:address])
			
      if @invitation.save
       	redirect_to @invitation, notice: "Invitation successfully updated."
     	else
       	render 'edit'
     	end
		else
			session[:invitation_id] = @invitation.id 
			@invitation.attributes = params[:invitation] 
			@invitation.rsvp_number = params[:rsvp_number]
			@invitation.change_address(params[:address])

     	if @invitation.save
				session[:invitation_id] = nil
				session[:is_authenticated] = nil
       	redirect_to thankyou_path
     	else
       	render :index
      end
		end
  end
	
	def thankyou
	end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
		if !admin_signed_in?
			redirect_to  
			return
		end

    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :no_content }
    end
  end

	private

	def sort_column
		params[:sort] || "first_names"
		%w[first_names last_name spots rsvp_number].include?(params[:sort]) ? params[:sort] : "first_names"
	end

	def sort_direction
		%w[as desc].include?(params[:direction]) ? params[:direction] : "asc"
	end
end
