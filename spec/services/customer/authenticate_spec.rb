require 'rails_helper'
require 'spec_helper'


describe Customer::Authenticator do
  describe '#authenticate' do

    example '正しいパスワードならtrueを返す' do
      #データベースに登録する必要がないからbuild
      c = build(:customer)
      expect(Customer::Authenticator.new(c).authenticate('12345')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      c = build(:customer)
      expect(Customer::Authenticator.new(c).authenticate('x')).to be_falsey
    end

    example 'パスワードが未設定ならfalseを返す' do
      #c = Customer.new(password:nil)
      c = build(:customer, password:nil)
      expect(Customer::Authenticator.new(c).authenticate(nil)).to be_falsey
    end

  end
end
