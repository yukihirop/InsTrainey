class Customer < ActiveRecord::Base

  include StringNormalizer

  has_one :email

  # getterとsetterを定義
  # attr_accessor :password

  before_validation do
    #セッター側ではselfは省略できない
    # @customer = ApplicationController.helpers.current_customer
    @email = Email.find_by(id: self.email.id)
    self.email_for_index = @email.main.downcase if @email.main
    self.name_kana = normalize_as_furigana(name_kana)
  end

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  # KATAKANA_REGEXP = /^[ｧ-ﾝﾞﾟァ-ンー－]+$/

  # remote:trueのときはうまくいかない
  # validate :name, presence: true
  # validate :name_kana, format: {with: KATAKANA_REGEXP, allow_blank: true}


  validate :add_error, on: :name


  def add_error

    unless name_kana =~ KATAKANA_REGEXP
      errors[:base] << '名前(カタカナ)がカタカナではありません'
    end

    if name.blank?
      errors[:base] << '名前が空欄です。'
    end

  end


  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end



end
