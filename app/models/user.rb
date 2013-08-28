class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true
  validates :password, presence: true

  def authenticate(password)
    return true if self.password == password
  end

end
