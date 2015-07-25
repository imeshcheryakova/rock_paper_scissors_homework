class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def rps

    db=Move.new

    @all_moves = Move.all

    @user_move = params["the_move"]

    @computer_move = ["rock", "paper", "scissors"].sample

    if @user_move == @computer_move
      @outcome = "tied"
      db.user_wins=0
      db.computer_wins=0
      db.tie=1
    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "won"
      db.user_wins=1
      db.computer_wins=0
      db.tie=0
    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "lost"
      db.user_wins=0
      db.computer_wins=1
      db.tie=0
    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "lost"
      db.user_wins=0
      db.computer_wins=1
      db.tie=0
    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "won"
      db.user_wins=1
      db.computer_wins=0
      db.tie=0
    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "lost"
      db.user_wins=0
      db.computer_wins=1
      db.tie=0
    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "won"
      db.user_wins=1
      db.computer_wins=0
      db.tie=0
    end

    db.user_move=@user_move
    db.computer_move=@computer_move

    db.save

    @paper_user_wins=Move.where({:user_move=>"paper"}).sum("user_wins")
    @paper_computer_wins=Move.where({:user_move=>"paper"}).sum("computer_wins")
    @paper_tied=Move.where({:user_move=>"paper"}).sum("tie")

    @rock_user_wins=Move.where({:user_move=>"rock"}).sum("user_wins")
    @rock_computer_wins=Move.where({:user_move=>"rock"}).sum("computer_wins")
    @rock_tied=Move.where({:user_move=>"rock"}).sum("tie")

    @scissors_user_wins=Move.where({:user_move=>"scissors"}).sum("user_wins")
    @scissors_computer_wins=Move.where({:user_move=>"scissors"}).sum("computer_wins")
    @scissors_tied=Move.where({:user_move=>"scissors"}).sum("tie")

    @total_user_wins=Move.sum("user_wins")
    @total_computer_wins=Move.sum("computer_wins")
    @total_tied=Move.sum("tie")

    @complete_history=Move.count



    render("move.html.erb")
  end

  # Your code goes below.

end
