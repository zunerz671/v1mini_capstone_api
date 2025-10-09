class TeamsController < ApplicationController
  after_action :send_email, only: [ :create ]
  before_action :authorize_request

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

    authorize team

    if team.save
      render json: team
    else
      render json: team.errors, status: :unprocessable_entity
    end
  end

  def show
    team = Team.find(params[:id])

    authorize team

    render json: team
  end

  def update
    team = Team.find(params[:id])
    team.update(
      name: params[:name],
      win: params[:win],
      loss: params[:loss]
    )

    authorize team

    render json: team
  end

  def delete
    team = Team.find(params[:id])

    authorize team

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
