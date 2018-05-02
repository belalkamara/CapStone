module PageTitle
  extend ActiveSupport::Concern

  included do
    before_action :page_defaults
  end
  
  def page_defaults
    @page_title = "Race the Day"
    @seo_keywords = "BOOM BABY"
  end
end