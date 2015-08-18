class StaticPagesController < ApplicationController
  def home
     @companies3 = Company.joins("INNER JOIN reviews ON reviews.company_id = companies.id")
    .select("companies.id, companies.*, avg(reviews.rate) as average_raiting, count(reviews.id) as number_of_reviews")
    .group("companies.id")
    .order("average_raiting DESC, number_of_reviews DESC")
    
    @companies4 = Company.joins("LEFT JOIN reviews ON companies.id = reviews.company_id WHERE reviews.company_id IS NULL")
    
    @companies = @companies3 + @companies4
    
    
    @companies = Company.joins("LEFT OUTER JOIN reviews ON reviews.company_id = companies.id")
    .select("companies.id, companies.*, avg(reviews.rate) as average_raiting, count(reviews.id) as number_of_reviews")
    .group("companies.id")
    .order("average_raiting DESC, number_of_reviews DESC").limit(3)
    
    @companies2 = Company.joins("LEFT OUTER JOIN reviews ON reviews.company_id = companies.id")
    .select("companies.id, companies.*, avg(reviews.rate) as average_raiting, count(reviews.id) as number_of_reviews")
    .group("companies.id")
    .order("average_raiting DESC, number_of_reviews DESC")
    gon.companies = @companies2
    
    
  end
  
  def hire
  end

  def table
  end
end
