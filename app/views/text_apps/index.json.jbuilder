json.array!(@text_apps) do |text_app|
  json.extract! text_app, :id, :phone_num, :name
  json.url text_app_url(text_app, format: :json)
end
