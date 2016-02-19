class Loan < ActiveRecord::Base
  belongs_to :lender, dependent: :destroy
  belongs_to :borrower, dependent: :destroy
end
