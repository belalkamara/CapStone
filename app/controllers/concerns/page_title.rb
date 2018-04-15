module PageTitle
  extend ActiveSupport::Concern

  included do
    before_action :page_defaults
  end
  
  def page_defaults
    @page_title = "Miles Up"
    @seo_keywords = "BOOM BABY"
  end
end