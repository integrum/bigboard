class FailsController < ApplicationController
  set_model 'FailsModel'
  set_view 'FailsView'
  set_close_action :exit

  def load
    model.poll_fails
    Thread.new do
      while true
        sleep 5
        begin
          model.poll_fails
        rescue
        end
        on_edt { update_view }
      end
    end
  end
end
