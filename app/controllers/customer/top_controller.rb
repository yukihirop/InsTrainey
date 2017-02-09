class Customer::TopController < Customer::Base

  def index

    #TODO:あとで消す
    session.delete(:customer_id)

    if current_customer
      render action: 'dashboard'
    else
      render action: 'index'
    end
  end

  def sign_up
  end

end
