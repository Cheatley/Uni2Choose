json.array!(@searches) do |search|
  json.extract! search, :id, :keyword, :standard_grades, :select_course
  json.url search_url(search, format: :json)
end
