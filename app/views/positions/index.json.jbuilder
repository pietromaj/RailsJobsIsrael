json.array!(@positions) do |position|
  json.extract! position, :id, :title, :description
  json.url position_url(position, format: :json)
end
