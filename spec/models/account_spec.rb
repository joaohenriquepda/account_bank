require "spec_helper"

RSpec.describe Account, :type => :model do
    
  describe "Account"  do
    
    it "has a valid factory" do
      Factory.create(:account).should be_valid
    end
    
    it "is not valid without a cpf" do
      Factory.build(:account, cpf: nil).should_not be_valid
    end
    
    it "is not valid without a email"
    it "is not valid without a password"
    
    
    it "does not allow duplicate cpf per account" do
      Factory.build(:account, cpf: "10101010" )
      Factory.build(:account, cpf: "10101010").should_not be_valid
    end
    
    it "does not allow duplicate email per account" do
      Factory.build(:account, cpf: "10101010",email:"email@gmail.com" )
      Factory.build(:account, cpf: "11111111", email:"email@gmail.com" ).should_not be_valid
    end
    
  end
  
end