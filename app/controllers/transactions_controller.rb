class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_wrong_user

  def index
    @transactions = Transaction.where(season_id: params[:season_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save

    redirect_to franchise_season_transactions_path
  end
  #
  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.where(season_id: params[:season_id], id: params[:id])

    if @transaction.update(transaction_params)
      redirect_to franchise_season_transactions_path
    else
      redirect_to franchise_season_transactions_path
    end
  end
  #
  def destroy
    @transaction = Transaction.where(season_id: params[:season_id], id: params[:id])
    @transaction.first.destroy

    flash[:notice] = 'Transaction Deleted.'
    redirect_to franchise_season_transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_type, :details, :season_id)
  end

  def redirect_wrong_user
    redirect_to :root unless Franchise.find(params[:franchise_id]).user_id == current_user.id
  end
end
