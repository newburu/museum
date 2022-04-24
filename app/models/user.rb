class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         # Twitter API認証用に追加
         :omniauthable, omniauth_providers: [:twitter]

  has_many :museums, dependent: :destroy

  has_many :follows, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  def to_param
    code
  end

  # Twitter認証ログイン用
  # ユーザーの情報があれば探し、無ければ作成する
  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    user ||= User.new(
      uid: auth.uid,
      provider: auth.provider,
      code: auth[:info][:nickname],
      name: auth[:info][:name],
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20],
    )
    user.image = auth.info.image.gsub("_normal","") if user.provider == "twitter"
    user.save!

    user
  end

  # ダミーのメールアドレスを作成
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end

  # ダミーのユニークになるコードを作成
  def self.dummy_uniq_code()
    code = ""
    while code.blank? || User.find_by(code: code).present? do
      code = SecureRandom.alphanumeric(10)
    end

    code
  end
  
end
