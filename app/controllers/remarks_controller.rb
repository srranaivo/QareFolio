class RemarksController < ApplicationController
  def create
    consultation = Consultation.find(params[:consultation_id])
    @remark = consultation.remarks.new(remark_params)
    if @remark.save
      redirect_to consultation_path(consultation.id)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def remark_params
    params.require(:remark).permit(:title, :description, :tag)
  end
end
