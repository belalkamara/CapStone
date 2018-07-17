class ActivitiesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activities_#{params['activity_id']}_channel"
  end

  def unsubscribed
    
  end

  def send_act_join(data)
    current_user.act_joins.create!(activity_id: data['activity_id'])
  end
end


