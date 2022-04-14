class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,　uniqueness: true
  # has_secure_passwordメソッドを記入することで、セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できる
  # autehnticateメソッドが使用できる。また、（passwordとpassword_confirmation）というペアの属性が使えるようになり値が一致するかどうかのバリデーションが追加される
  has_secure_password
end
