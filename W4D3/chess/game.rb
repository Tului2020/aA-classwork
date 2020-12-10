class Game

  def initialize#(player1, player2)

    @board = ''
    @display = '' 
    @players = {}
    @current_player = ''
  end

  def play
  end

  private
  def notify_players
  end

  private
  def swap_turn!
    if @current_player == @players[1]
      @current_player = @players[2]
    else
      @current_player = @players[1]
    end
  end

end