json.extract! dailyform, :id, :date, :yesterday, :today, :blockage, :created_at, :updated_at
json.url dailyform_url(dailyform, format: :json)
