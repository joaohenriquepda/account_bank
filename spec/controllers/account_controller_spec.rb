require "spec_helper"

# TODO - Terminar os testes
RSpec.describe AccountController, :type => :controller do
    describe "AccountController"  do
    
        # before do 
        #  token = JWT.encode({user: User.first.id}, 
        #     ENV["AUTH_SECRET"], "HS256")
        #   header "Authorization", #{token}"
        #   post "/auth/login"
        # end
       
        it "login in Account" do
        end
        
        it 'responds with a message of Not found' do
            message = json["errors"].first["detail"] 
            expect(message).to eq("Not found")
        end
    end
end
