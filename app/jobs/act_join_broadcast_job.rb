class ActJoinBroadcastJob < ApplicationJob
  queue_as :default

  def perform(act_join)
    ActionCable.server.broadcast "activities_#{act_join.activity_events.id}_channel", act_join: render_act_join(act_join)
  end

  private

  def render_act_join(act_join)
    ActJoinsController.render partial: 'act_joins/act_join', locals: { act_join: act_join }
  end
end