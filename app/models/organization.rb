class Organization < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :prefecture, presence: true, length: { maximum: 50 }
  validates :city, presence: true, length: { maximum: 50 }
    
  has_many :accounts
  has_many :employee, through: :accounts, source: :user
  
  def administrating?(user)
    account = Account.where(user_id: user.id, organization_id: :self.id)
    if account.administratible == true
      return true
    else
      return false
    end
  end
  
  def administrators
    @administrators = Account.where(organization_id: :self.id, administratible: :true)
    return @administrators
  end
end
