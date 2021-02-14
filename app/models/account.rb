class Account < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  
  has_many :messages
  has_many :participates
  has_many :requests
  has_many :requestings, through: :requests, source: :requested
  has_many :reverses_of_request, class_name: 'Request', foreign_key: 'requested_id'
  has_many :requested, through: :reverses_of_request, source: :account
  has_many :rooms, through: :participates, source: :room

  def requestto(other_account)
    unless self == other_account
      self.requests.find_or_create_by(requested_id: other_account.id, status: true)
    end
  end
  
  def rejectto(other_account)
    unless self == other_account
      reject = Request.where(account_id: other_account.id, requested_id: self.id, status: true)
      reject.update(status: false)
    end
  end
  
  def unrequestto(other_account)
    request = self.requests.find_by(requested_id: other_account.id)
    request.destroy if request
  end

  def requesting?(other_account)
    if Request.where(account_id: self.id, requested_id: other_account.id).select("status") == 1
      return 1
    else
      return 0
    end
  end
  
  def rejected?
    if Request.where(account_id: self.id, requested_id: other_account.id).select("status") == 0
      return 1
    else 
      return 0
    end
  end
  
  def participate(other_account)
    requested = self.requests.find_by(follow_id: other_user.id)
    requested.destroy if requested
    self.participates.find_or_create_by(room_id: reoom.id, status: true)
  end 
  

end
