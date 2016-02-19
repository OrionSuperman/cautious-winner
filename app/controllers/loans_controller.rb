class LoansController < ApplicationController
	def index
		@borrower = Borrower.new
		@lender = Lender.new
	end

	def create

		borrower = Borrower.find(params[:borrower_id])
		lender = Lender.find(session[:lender_id])

		if lender.money > (params[:amount]).to_i and (params[:amount]).to_i > 0
			borrower.raised += (params[:amount]).to_i
			borrower.save
			lender.money -= (params[:amount]).to_i
			lender.save

			loan = Loan.create(amount:params[:amount], borrower:borrower, lender:lender)
		else
			flash[:errors] = "You do not have enough money to make this loan!"
		end
		redirect_to "/lenders/#{lender.id}"
	end
end
