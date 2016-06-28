json.array!(@searches) do |search|
  json.extract! search, :id, :select_course1, :select_course2, :select_course3, :select_course4, :select_course5 
  json.url search_url(search, format: :json)
end
