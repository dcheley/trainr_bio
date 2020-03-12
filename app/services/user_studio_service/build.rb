module UserStudioService
  module Build
    def self.call(params)
      UserStudio.new(user_id: params[:user_id], studio_id: params[:studio_id])
    end
  end
end
