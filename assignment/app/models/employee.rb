class Employee < ActiveRecord::Base
  include Sample
  
  belongs_to :company
  has_one :address , as: :resource , dependent: :destroy
  has_one :account

  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,:email,:phone,:salary,:designation ,presence: true 
  validates :name , format: {with: /[[[:alpha]][[:blank]]]+/ } 
  validates :email ,format: {with: VALID_EMAIL_REGEX} , uniqueness: {scope: :company, case_sensitive: false}
  validates :salary, numericality:{ greater_than: 0 }
  validates :phone ,format:{with:/\A\+\d+/} , uniqueness: {scope: :company}
end