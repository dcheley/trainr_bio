module TrainerStudioService
  module Build
    def self.call(params)
      TrainerStudio.new(trainer_id: params[:trainer_id], studio_id: params[:studio_id])
    end
  end
end
