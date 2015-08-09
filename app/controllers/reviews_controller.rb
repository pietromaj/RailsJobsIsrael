class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_company
  before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
  #before_action :check_user, only: [:edit, :create, :destroy]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.company_id = Company.find_by(permalink: params[:company_id]).id
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to "/companies/#{params[:company_id]}", notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to "/companies/#{params[:company_id]}", notice: 'You have already reviewed this company!' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to "/companies/#{params[:company_id]}", notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render "/companies/#{params[:company_id]}", notice: 'Oops, something went wrong!!' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end
    
    def set_company
      @company = Company.find_by(id: params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rate, :content, :company_id, :user_id)
    end
    
    def check_user
      unless @review.user_id == current_user.id
        redirect_to :back, alert: "This review belongs to someone else!"
      end
    end
end
