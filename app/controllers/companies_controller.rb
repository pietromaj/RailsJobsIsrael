class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.joins("LEFT OUTER JOIN reviews ON reviews.company_id = companies.id")
    .select("companies.id, companies.*, avg(reviews.rate) as average_raiting, count(reviews.id) as number_of_reviews")
    .group("companies.id")
    .order("average_raiting DESC, number_of_reviews DESC").limit(8)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    if user_signed_in?
    @user_id = current_user.id
    @already_reviewed = Review.where(user_id: current_user.id, company_id: @company.id).presence
  else
    @already_reviewed = false
  end
    @reviews = Review.where(company_id: @company.id)
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rate).round(2)
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   def autocomplete_request
      @company = Company.where("name like '%#{params[:search]}%' ").limit(7)
  
      @company = @company[0..6]
  
      data = []
  
      @company.each do |company|
        data << "#{company.name}"
      end
  
      render json: data
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find_by_permalink(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :picture, :address, :description)
    end
    
    def check_admin
      unless current_user.admin == true
        redirect_to root_path, alert: "Bad, bad user! You don't have permission to do that!"
      end
    end
    
   
end
