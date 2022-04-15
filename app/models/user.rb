class User < ApplicationRecord
  attr_accessor :remember_token
  # Active Recordのコールバック (callback) メソッドを利用して、大文字で入力しても強制的に小文字に変換する
  before_save { self.email = email.downcase }
  validates :name, presence: true
  # 有効なメールアドレスかを判別するためにformatオプションをを用いて引数に正規表現(Regular Expression)を取る
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }
  # has_secure_passwordメソッドを記入することで、セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できる
  # autehnticateメソッドが使用できる。また、（passwordとpassword_confirmation）というペアの属性が使えるようになり値が一致するかどうかのバリデーションが追加される
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
end
