class Email < ActiveRecord::Base

  #belongs_to :customer

  before_validation do
    self.sub_1 = sub_1.downcase if sub_1
    self.sub_2 = sub_2.downcase if sub_2
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  # この書き方は知らんとつらいな・・・
  # validates :sub_1, presence: true, email: true, unless: "sub_1 == nil"
  # validates :sub_2, presence: true, email: true, unless: "sub_2 == nil"

  validate :add_error

  def add_error

    unless sub_1 =~ VALID_EMAIL_REGEX
      errors[:base] << '入力されたメールアドレスは正しい形式ではありません。'
    end

    unless sub_2 =~ VALID_EMAIL_REGEX
      errors[:base] << '入力されたメールアドレスは正しい形式ではありません。'
    end

    if sub_1.blank?
      errors[:base] << 'メールアドレス入力欄が空欄です。'
    end

    if sub_2.blank?
      errors[:base] << 'メールアドレス入力欄が空欄です。'
    end


  end


  # after_validation do
  #   if errors.include?(:sub_1)
  #     p 'after sub_1 validation'
  #     self.errors.add(self.sub_1.downcase, 'は正しい形式のメールアドレスではありません。')
  #   elsif errors.include?(:sub_2)
  #     p 'after sub_2 validation'
  #     p self.sub_2.downcase
  #     self.errors.add(self.sub_2.downcase, 'は正しい形式のメールアドレスではありません。')
  #   end
  # end


end
