json.extract! contact, :id, :name, :cpf_cnpj, :birthday, :email, :mobile, :message, :advertising, :active, :created_at, :updated_at
json.url contact_url(contact, format: :json)
