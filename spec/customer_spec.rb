require 'rails_helper'
require 'spec_helper'

describe Customer do
  describe '#password=' do

    example '文字列を与えると、hashed_passwordは長さ60の文字列になる' do
      customer = Customer.new
      customer.password = 'instrainey'
      expect(customer.hashed_password).to be_kind_of(String)
      expect(customer.hashed_password.size).to eq(60)
    end

    example 'nilを与えるとhashed_passwordはnilになる' do
      customer = Customer.new(hashed_password:'x')
      customer.password = nil
      expect(customer.hashed_password).to be_nil
    end

  end
end
