class IllnessRequestsController < BaseController

  def index
    @illness_requests = current_patient.illness_requests
  end

  def show
    @illness_request = IllnessRequest.find(params[:id])
  end

  def new
    @symptoms = Symptom.all
    @illness_request = IllnessRequest.new
  end

  def create
    illness_request_creator = IllnessRequestCreator.new(current_patient, illness_request_params)
    @illness_request = illness_request_creator.run
    if @illness_request.valid?
      redirect_to @illness_request, notice: t('notices.illness_request')
    else
      render :new
    end
  end

  private

  def illness_request_params
    params.require(:illness_request).permit(
        :admissible_cost,
        :allowable_reception_time,
        :distance,
        :patient_id,
        symptom_ids: []
    )
  end
end
