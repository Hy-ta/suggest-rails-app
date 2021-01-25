require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    context 'Get #index' do
        it 'returns a success responses' do
            get :index
            expect(response).to be_successful        
        end
    end

    context 'Get #show' do
        it 'returns a success responses' do
            user = User.create!(name:"name", email: "sample@sample.com", password: "sample1234", password_confirmation: "sample1234")
            get :show, params: {id: user.to_param}
            expect(response).to be_successful
        end
    end
end
