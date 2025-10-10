class GamesController < ApplicationController
  after_action :send_email, only: [ :create, :update ]
  before_action :authorize_request

  def index
    games = Game.all

    render json: games
  end

  def create
    game = Game.new(game_params)   # uses team1_id/team2_id
    authorize game

    if game.save
      render json: game, status: :created
    else
      render json: { errors: game.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    game = Game.find(params[:id])

    authorize game

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

    authorize game

    render json: game
  end

  def delete
    game = Game.find(params[:id])

    authorize game

    game.destroy

    render json: { message: "Game deleted..." }
  end

  private

  def game_params
    # expects: game[team1_id], game[team2_id], game[team1score], game[team2score]
    params.require(:game).permit(:team1_id, :team2_id, :team1score, :team2score)
  end

  def send_email
    puts " ---------- "
    puts " Mimicing sending an email confirmation..."
    puts " ---------- "
  end
end
