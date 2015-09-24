class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  has_many :websites

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :birthday, presence: true
  validates :gender, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  #   validate :active_customer, on: :destroy
 
  # def active_customer
  #   errors.add(:customer_id, "is not active") unless customer.active?
  # end

end

