module Concerns::State
  extend ActiveSupport::Concern

  # all states: 
  # [:open, :in_progress, :blocked, :urgent, :delayed, :finished]

  included do
    
  end

  def update_state
    respond_to do |format|
      Logger.new(STDOUT).info(">>>>>>>>>>>>> request.parameters:: #{request.parameters}")
      if @resource.update(state_params)
        format.html { redirect_to [:my, @resource], notice: "#{@resource.class.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end  
  end

  private

  def state_params
    object_symbol = controller_name.singularize.to_sym
    Logger.new(STDOUT).info(">>>>>>>>>>>>> object_symbol:: #{object_symbol}")
    params.require(object_symbol).permit(:progress_state)
  end
  
end