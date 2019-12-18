class Phones < Grape::API
  
  format :json

  resource :phones do
    
    desc 'Allot a phone number'
    params do
      optional :phone, type: String, desc: 'Phone number'
    end
    post '/:phone' do
      phone = Phone.new
      phone.assing_phone_number(params[:phone])
      phone.save
      { phone:  phone.number}
    end

    desc 'Get all assigned phone numbers'
    get do
      { phones: Phone.all.map(&:number) }
    end
  
  end
end