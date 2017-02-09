class Customer::ProfileForm
  # Rails4でDBに保存しないModelをValidationする
  include ActiveModel::Model
  # before_validationを使うため
  include ActiveModel::Validations::Callbacks

  # valid?が使えるようになる(activemodelのValidと喧嘩してしまうから消さないといけない)
  # include ActiveRecord::Validations
  # include ActiveRecord::Reflection

  attr_accessor :object, :email, :name, :name_kana,
                :current_password, :new_password, :new_password_confirmation


  before_validation do
    object[:email] = email.downcase if email
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validate :add_error_email, on: :email
  validate :add_error_password, on: :password


  def add_error_email

    unless object[:email] =~ VALID_EMAIL_REGEX
      errors[:base] << '入力されたメールアドレスは正しい形式ではありません。'
    end

    if object[:email].blank?
      errors[:base] << 'メールアドレス入力欄が空欄です。'
    end

  end


  def add_error_password

    unless Customer::Authenticator.new(object).authenticate(current_password)
      errors[:base] << '現在のパスワードが間違えています。'
    end

    unless new_password == new_password_confirmation
      errors[:base] << '確認パスワードが一致しません。もう一度入力して下さい。'
    end

    if current_password.blank?
      errors[:base] << '現在のパスワードが空欄です。'
    end

    if new_password.blank?
      errors[:base] << '新しいパスワードが空欄です。'
    end

    if new_password_confirmation.blank?
      errors[:base] << '確認パスワードが空欄です。入力して下さい。'
    end

  end

  def save


    if valid?(:password)
      # このpasswordはCustomerモデルのメソッド
      object.password = new_password
      object.save!
    end


  end

end
