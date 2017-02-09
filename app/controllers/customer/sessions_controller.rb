class Customer::SessionsController < Customer::Base


  #フォームの表示
  def form
    if current_customer
      #TODO: 'https://manage.instrainey.jp(customerの個人ページ)にリダイレクト予定'
      redirect_to :customer_root
    else
      @form = Customer::LoginForm.new
      render action: 'new'
    end
  end

  #新規登録
  def new
    @form = Customer::LoginForm.new(params[:customer_login_form])
    customer = Customer.find_by(params[:id])
    session[:customer_id] = customer.id
    flash.now.notice = '新規登録しました。'
    #TODO: 'https://manage.instrainey.jp(customerの個人ページ)にリダイレクト予定'
    render :file => '/customer/top/dashboard'
  end

  #ログイン
  def create
    @form = Customer::LoginForm.new(params[:customer_login_form])

    if @form.email.present?
      customer = Customer.find_by(email_for_index: @form.email.downcase)
    end

    if Customer::Authenticator.new(customer).authenticate(@form.password)
      session[:customer_id] = customer.id
      flash.now.notice = 'ログインしました。'
      #TODO: 'https://manage.instrainey.jp(customerの個人ページ)にリダイレクト予定'
      render :file => '/customer/top/dashboard'
    else
      flash.now.alert = 'メールアドレスまはたパスワードが正しくありません。'
      render action: 'new'
    end

  end

  #ログアウト
  def destroy
    session.delete(:customer_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :customer_root
  end

end
