class BorrowersController < ApplicationController
  def index
  end

  def show
    @borrower = Borrower.find(params[:id])
    @loans = Loan.where(borrower_id: @borrower.id)
  end

  def new
  end

  def create
    borrower = Borrower.new(borrower_params)
    if borrower.valid?
      borrower.raised = 0
      borrower.save
      session[:borrower_id] = borrower.id
      redirect_to "/borrowers/#{borrower.id}"
    else
      flash[:errors] = borrower.errors
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
    borrower = Borrower.find_by_email(params[:email])
    if borrower && borrower.authenticate(params[:password])
      session[:borrower_id] = borrower.id
      redirect_to "/borrowers/#{borrower.id}"
    else
      flash[:errors] = ['Invalid Email/Password']
      redirect_to '/login'
    end
  end

  def logout
    session[:borrower_id] = nil
    redirect_to '/'
  end

  private
  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :purpose, :description, :needed, :email, :password)
  end
end
