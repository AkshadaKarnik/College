#json.extract! college :id, :name, :email, :address, :contact, :created_at, :updated_at
#json.url college_url(college, format: :json)


#json.array! @colleges, partial: "colleges/college", as: :college
