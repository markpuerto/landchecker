class LocationsController < ApplicationController
  before_action :connect_db

  def index
    raise StatusError.new(code: :unprocessable_entity), "Database has an issue. Please contact developer." unless @connection.db_exist?
    
    results = @connection.query_all
    pagination = Pagination.new(page: params[:page], total: @connection.query_count).call

    render json: { results:, pagination: }, status: :ok
  rescue StatusError => error
    render json: { error: }, status: error.code
  end

  def show
    id = params[:id]

    raise StatusError.new(code: :unprocessable_entity), "Database has an issue. Please contact developer." unless @connection.db_exist?
    raise StatusError.new(code: :bad_request), "Identifier is not a valid number" unless id.is_number?
    
    lga = @connection.find_by(id:)

    raise StatusError.new(code: :not_found), "LGA cannot be found" if lga.nil?

    render json: lga, status: :ok
  rescue StatusError => error
    render json: { error: }, status: error.code
  end

  private
    def connect_db
      @connection = PgConnect.new(page: params[:page])
    end
end
