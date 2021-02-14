class Request < ApplicationRecord
  belongs_to :account
  belongs_to :requested, class_name: 'Account'
end
