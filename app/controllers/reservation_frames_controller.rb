class ReservationFramesController < ApplicationController

  def index
    @day = Time.current.beginning_of_day
    if params[:yyyy] && params[:mm] && params[:dd] then
      @day = Time.new(params[:yyyy], params[:mm], params[:dd])
    end
    @reservation_frames = ReservationFrameCollection.new(day: @day, teacher_id: current_teacher.id)
  end

  def create
    @reservation_frames = ReservationFrameCollection.new(reservation_frame_collection_params)
    if @reservation_frames.save
      redirect_to root_path, notice: "商品を登録しました"
    else
      flash.now[:alert] = "商品登録に失敗しました"
      render :new
    end

  end

  private
    def reservation_frame_collection_params
      params.require(:reservation_frame_collection)
      .permit(reservation_frames_attributes: [:id, :start_time, :end_time, :teacher_id, :availability])
    end

end
