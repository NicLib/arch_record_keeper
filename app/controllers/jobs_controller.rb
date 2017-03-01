class JobsController < ApplicationController
  before_action :refuse_view
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /jobs
  # GET /jobs.json
  def index
    #Code for sorting columns found: http://railscasts.com/episodes/228-sortable-table-columns
    if params[:search]
       @jobs = Job.search(params[:search]).paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
     else
       @jobs = Job.paginate(page: params[:page]).order(sort_column + ' ' + sort_direction)
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def totals
    @end_time = Time.now
    @begin_time = @end_time - 1.year
    @jobs = Job.all
    @au_jobs = Job.where(au_chog: 'AU')
    @chog_jobs = Job.where(au_chog: 'CHOG')
    @total_au = Job.where(au_chog: 'AU')
    @total_chog = Job.where(au_chog: 'CHOG')
  end

  #Refuses view if not logged in
  def refuse_view
      if !current_user
          redirect_to(root_path)
          flash.now[:danger] = 'Must be logged in'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :country, :telephone, :email, :subject, :person_type, :research_use, :time_spend, :au_chog, :complete, :notes, :start_date, :end_date)
    end

    def sort_column
      Job.column_names.include?(params[:sort]) ? params[:sort] : 'last_name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
