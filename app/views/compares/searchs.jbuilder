json.array!(@mobiles) do |mobile|
  json.name mobile.name
  json.url compares_create_path(search_mobile_id: mobile.id)
end
