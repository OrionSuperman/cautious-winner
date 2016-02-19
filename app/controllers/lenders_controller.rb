class LendersController < ApplicationController
  def index
  end

  def show
    @lender = Lender.find(params[:id])
    @borrowers = @lender.borrowers
    @needy = Borrower.all
    @loans = Loan.where(lender_id: @lender.id)
  end

  def new
  end

  def create
    lender = Lender.new(lender_params)
    if lender.valid?
      lender.save
      session[:lender_id] = lender.id
      redirect_to "/lenders/#{lender.id}"
    else
      flash[:errors] = lender.errors
      redirect_to "/"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def login
    lender = Lender.find_by_email(params[:email])
    if lender && lender.authenticate(params[:password])
      session[:lender_id] = lender.id
      redirect_to "/lenders/#{lender.id}"
    else
      flash[:errors] = ['Invalid Email/Password']
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :money, :email, :password)
  end
end
