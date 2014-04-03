json.array!(@courses) do |course|
  json.extract! course, :id, :code, :name, :description, :length, :image_url, :start_time, :source_url, :audit_status
  json.url course_url(course, format: :json)
end
