class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  def index
    @boards = Board.all_boards(current_user.id)
    
  end

  def show
    @lists = @board.lists.all
  end

  def new
    @board = Board.new
  end

  def create 
    @board = current_user.boards.new(board_params)
    if @board.save
      redirect_to boards_path
    end
  end


  def edit
  end

  def update
      if @board.update(board_params)
        redirect_to @board
      else
        render :edit
    end
  end

  def destroy
    Board.delete_board(@board.id)
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

def set_board
  @board = current_user.boards.find(params[:id])
end

end
