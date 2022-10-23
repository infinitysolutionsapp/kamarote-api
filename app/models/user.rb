class User < ApplicationRecord
    has_one :account, dependent: :delete
    has_one_attached :image


    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 6 },
              if: -> { new_record? || !password.nil? }

    def as_json(options = {})
        super(options.merge({ except: [:password_digest] }))
    end


end
