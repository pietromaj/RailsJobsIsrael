json.array!(@companies) do |company|
  json.extract! company, :id, :name, :picture, :address, :description
  json.url company_url(company, format: :json)
end
