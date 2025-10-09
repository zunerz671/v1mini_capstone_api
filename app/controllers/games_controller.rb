class GamesController < ApplicationController
  after_action :send_email, only: [ :create, :update ]

  def index
    games = Game.all

    render json: games
  end

  def create
    game = Game.new(
      team1: params[:team1],
      team2: params[:team2],
      team1score: params[:team1score],
      team2score: params[:team2score]
    )

    if game.save
      render json: game
    else
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def show
    game = Game.find(params[:id])

    render json: game
  end

  def update
    game = Game.find(params[:id])
    game.update(
      team1: params[:team1],
      team2: params[:team2],
      team1score: params[:team1score],
      team2score: params[:team2score]
    )

    render json: game
  end

  def delete
    game = Game.find(params[:id])

    game.destroy

    render json: { message: "Game deleted..." }
  end

  private

  def send_email
    puts " ---------- "
    puts " Mimicing sending an email confirmation..."
    puts " ---------- "
  end
end
