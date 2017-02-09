class Customer::ProfilesController < Customer::Base


  def show
    @customer = current_customer
  end


  # これでプロフィール写真・名前・メールアドレス・Facebook・Twitterすべて編集できる
  def edit
    respond_to do |format|
      @params = params[:id]
      @customer = current_customer
      @current_customer_email = Email.find_by(customer_id: @customer.id)
      @profile_form = Customer::ProfileForm.new(object: @current_customer_email)
      format.js
    end
  end


  # jsでレンダリング
  # emailのメインの話
  def change
    respond_to do |format|
      @params = params[:id]
      @customer = current_customer
      @emails = Email.find_by(customer_id: @customer.id)
      if @params == 'sub_1'
        @email_main = @emails.main
        @emails.main = @emails.sub_1
        @emails.sub_1 = @email_main
      elsif @params == 'sub_2'
        @email_main = @emails.main
        @emails.main = @emails.sub_2
        @emails.sub_2 = @email_main
      end

      if @emails.save
        flash.now.notice = "「#{@emails.main}」をメインに設定しました。"
        @current_customer_email = Email.find_by(customer_id: @customer.id)
        @profile_form = Customer::ProfileForm.new(object: @current_customer_email)
        format.js
      end
    end
  end


  def update

    @edit_type = params[:edit_type]
    p "edit_typeは、#{@edit_type}です。"

    if @edit_type == 'img'
      update_img
    elsif @edit_type == 'name'
      update_name
    elsif @edit_type == 'email'
      update_email
    elsif @edit_type == 'password'
      update_password
    end

  end


  # jsでレンダリング
  def destroy

    @params = params[:id]
    @customer = current_customer
    @emails = Email.find_by(customer_id: @customer.id)

    respond_to do |format|

      if @params == 'sub_1'
        @delete_email = @emails.sub_1
        @emails.sub_1 = nil
      elsif @params == 'sub_2'
        @delete_email = @emails.sub_2
        @emails.sub_2 = nil
      end

      if @emails.save :validate => false
        flash.now.alert = "メールアドレス「#{@delete_email}」を削除しました。"
        @current_customer_email = Email.find_by(customer_id: @customer.id)
        @profile_form = Customer::ProfileForm.new(object: @current_customer_email)
        format.js
        format.html
      end

    end

  end

  def register_email
    @register_email = session[:register_email]
    @customer = current_customer
    @current_customer_email = Email.find_by(customer_id: @customer.id)

    if @current_customer_email.sub_1 == nil
      @current_customer_email.sub_1 = @register_email
    elsif @current_customer_email.sub_2 == nil
      @current_customer_email.sub_2 = @register_email
    end

    if @current_customer_email.save

      flash.now.notice = "メールアドレス「#{@register_email}」を登録しました。"
      # showアクションに対応したviewが表示される。
      render action: 'show'

    else


    end


  end


  def create

  end


  private

  # update > email
  def update_email

    @customer = current_customer
    @current_customer_email = Email.find_by(customer_id: @customer.id)
    @profile_form = Customer::ProfileForm.new(object: change_profile_form_params)


    if @profile_form.valid?(:email)
      respond_to do |format|
        session[:register_email] = @profile_form.object[:email]
        flash.now.notice = "ご本人様確認メールを「#{@profile_form.object[:email]}」宛に送信しましたので、ご確認ください。"
        @mail = NoticeMailer.sendmail_confirm(@customer, @profile_form.object[:email]).deliver
        format.js
      end
    else
      # status: 422でajax:errorが着火
      render json: {messages: @profile_form.errors.full_messages}, status: 422
    end

  end

  # update > name
  def update_name

    @customer = current_customer
    @customer.assign_attributes(customer_params)
    @current_customer_email = Email.find_by(customer_id: @customer.id)

    if @customer.save(context: :name)
      flash.now.notice = "名前を「#{@customer.name}」に変更しました。"
      render action: 'show'
    else
      # status: 422でajax:errorが着火
      render json: {messages: @customer.errors.full_messages}, status: 422
    end
  end


  # update > img
  def update_img

  end

  # update_password
  def update_password

    @customer = current_customer
    @current_customer_email = Email.find_by(customer_id: @customer.id)
    #@profile_form = Customer::ProfileForm.new(object: params[:customer_profile_form])
    @profile_form = Customer::ProfileForm.new(change_profile_form_params)
    @profile_form.object = @customer

    if @profile_form.save
      flash.now.notice = "パスワードを変更しました。"
      render :template => 'customer/profiles/show'
    else
      # status: 422でajax:errorが着火
      render json: {messages: @profile_form.errors.full_messages}, status: 442
    end


  end


  # StrongParams
  def customer_params
    # Customerクラス(ActiveRecordモデル)のシンボル:customer
    params.require(:customer).permit(
        :name, :name_kana, :email
    )
  end

  # StrongParams
  def change_profile_form_params
    params.require(:customer_profile_form).permit(
        :email, :current_password, :new_password, :new_password_confirmation
    )
  end

end
