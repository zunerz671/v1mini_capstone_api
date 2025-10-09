class TeamsController < ApplicationController
  after_action :send_email, only: [ :create ]

  def index
    teams = Team.all

    render json: teams
  end

  def create
    team = Team.new(
      name: params[:name],
      win: params[:win] || 0,
      loss: params[:loss] || 0
    )

    if team.save
      render json: team
    else
      render json: team.errors, status: :unprocessable_entity
    end
  end

  def show
    team = Team.find(params[:id])

    render json: team
  end

  def update
    team = Team.find(params[:id])
    team.update(
      name: params[:name],
      win: params[:win],
      loss: params[:loss]
    )

    render json: team
  end

  def delete
    team = Team.find(params[:id])

    team.destroy

    render json: { message: "Team deleted..." }
  end

  private

  def send_email
    puts " ---------- "
    puts " Mimicing sending an email confirmation..."
    puts " ---------- "
  end
end
