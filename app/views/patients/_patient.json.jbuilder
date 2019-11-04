json.extract! patient, :id, :name, :surname, :fathername, :adress, :phonenumber, :dob, :created_at, :updated_at
json.url patient_url(patient, format: :json)
