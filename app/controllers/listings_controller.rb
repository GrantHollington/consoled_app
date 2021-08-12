class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  # before_action :authenticate_user! - not used

  # GET /listings or /listings.json
  def index
    #contains all the listings
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
    #allowing a "buyer" to purchase 
    if params[:checkout] == "success"
      #update buyer - creating a new buyer and linking that to the profile table before updating the buyer and saving 
      Buyer.create(profile_id: current_user.profile.id)
      @listing.buyer_id = current_user.profile.buyer.id
      @listing.save
    end
  end

  # GET /listings/new
  def new
    # if the user not logged in redirect to the login page
    # else redirect to the to the console/game form page
    if user_signed_in?
      # if user has created a profile show the console/game form else redirect to create a profile page
      if current_user.profile
        @listing = Listing.new
      else 
        redirect_to new_profile_path
      end   
    else
      redirect_to new_user_session_path
    end
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    #creating a new listing
    @listing = Listing.new(listing_params)
    Seller.create(:profile_id => current_user.profile.id)
    #associate listing to a seller
    @listing.seller_id = current_user.profile.seller.id
    #saving a new listing or displaying an error if new listing cannot be created.
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    #updating the listings
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    #deleting a listing
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      #added mutiple pictures to upload as an array and removed picture from listings table
      params.require(:listing).permit(:title, :description, :price, :product, :condition, :buyer_id, :seller_id, pictures: [])
    end
end
