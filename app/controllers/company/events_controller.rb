class Company::EventsController < ApplicationController
  before_action :set_company
  before_action :set_company_event, only: [:show, :edit, :update, :destroy]
  include Company::EventsHelper
  # GET /company/events
  # GET /company/events.json
  def index
    @company_events = @company.events
  end

  # GET /company/events/1
  # GET /company/events/1.json
  def show
  end

  # GET /company/events/new
  def new
    @company_event = Company::Event.new
  end

  # GET /company/events/1/edit
  def edit
  end

  # POST /company/events
  # POST /company/events.json
  def create
    @company_event = @company.events.build(company_event_params)

    respond_to do |format|
      if @company_event.save
        format.html { redirect_to company_job_events_path(events_path_params(@company)), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @company_event }
      else
        format.html { render :new }
        format.json { render json: @company_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company/events/1
  # PATCH/PUT /company/events/1.json
  def update
    respond_to do |format|
      if @company_event.update(company_event_params)
        format.html { redirect_to  company_job_events_path(events_path_params(@company)), notice: 'Event was successfully updated.' }
        # format.json { render :show, status: :ok, location: @company_event }
      else
        format.html { render :edit }
        format.json { render json: @company_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company/events/1
  # DELETE /company/events/1.json
  def destroy
    @company_event.destroy
    respond_to do |format|
      format.html { redirect_to company_job_events_path(events_path_params(@company)), notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_company
      @company = Company.find(params[:company_id]).job_opportunities.find(params[:job_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_company_event
      @company_event = Company::Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_event_params
      params.require(:company_event).permit(:event_type,:organiser,:date_time,:duration)
    end
end