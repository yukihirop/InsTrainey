Customer.seed do |s|
    s.name = '山田太郎'
    s.email_for_index = Email.find_by(customer_id:1).main
    s.name_kana = 'ヤマダタロウ'
    s.password = '12345'
    s.image_url = '-'
    s.instagram_url = '-'
    s.instagram_name = 'yamada'
    s.facebook_url = '-'
    s.facebook_name = 'YamadaTarou'
    s.twitter_url = '-'
    s.twitter_name = 'yamamaada'
  end
