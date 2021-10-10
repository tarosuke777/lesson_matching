class ReservationFramesController < ApplicationController
  def index
    # @reservation_frames = 10.times.map{ReservationFrame.new}
    @reservation_frames = ReservationFrameCollection.new
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
