# seed_fuを使うときはすべてのデータを与えないとエラーになる
Email.seed do |s|
  s.customer_id = 1
  s.main = 'taro@example.com'
  s.sub_1 = 'sub_1@example.com'
  s.sub_2 = nil
end
