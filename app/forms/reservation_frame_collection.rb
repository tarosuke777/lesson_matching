class  ReservationFrameCollection
    include ActiveModel::Model
    include ActiveModel::Attributes

    DAYS = 7
    HOURS = 24

    attr_accessor :reservation_frames

    def initialize(attributes = {})
        super attributes
        # self.reservation_frames = FORM_COUNT.times.map { ReservationFrame.new() } unless self.reservation_frames.present?

        unless self.reservation_frames.present?
            self.reservation_frames = Array.new

            DAYS.times do |day|
                HOURS.times do |hour|
                    start_time = Time.current.beginning_of_day + day.day + hour.hours
                    teacher_id = 1
                    tmp = ReservationFrame.where(start_time: start_time, teacher_id: teacher_id).first
                    if tmp.present?
                        tmp.availability = true
                        self.reservation_frames << tmp
                    else
                        self.reservation_frames << ReservationFrame.new(
                        start_time: start_time, end_time: start_time  + 1.hours - 1.second, teacher_id: teacher_id)
                    end
                end
            end   
        end
    end

    def reservation_frames_attributes=(attributes)
        self.reservation_frames = attributes.map { |_, v| ReservationFrame.new(v) }
    end

    def save
        ReservationFrame.transaction do
          self.reservation_frames.map do |reservation_frame|
            if reservation_frame.id.present?
                ReservationFrame.destroy(reservation_frame.id) 
            end
            if reservation_frame.availability
                reservation_frame.save
            end
          end
        end
          return true
        rescue => e
          return false
    end

end