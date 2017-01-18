class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    self.table_name = 'customer'

    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true
    validates :address, presence: true 

end
