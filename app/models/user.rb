class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :playables
  has_many :games, through: :playables

  def game_in_progress_with(target_user)
    # Get all games the the user and target_user are playing each other.
    # Then, get all games where the state is in progress.
    # Should be unique by game_id.
    games
    .where(id: target_user.games)
    .where(state: :in_progress)
  end

end
