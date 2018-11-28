class Board < ApplicationRecord
  belongs_to :user
  has_many :lists 

  def self.all_boards(user_id)
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b
      WHERE b.user_id = #{user_id}"
    )
  end

  def self.delete_board(board_id)
    Board.find_by_sql(["
      DELETE FROM boards AS b
      WHERE b.id = ?
    ;", board_id])
  end
end
