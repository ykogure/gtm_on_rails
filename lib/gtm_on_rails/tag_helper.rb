module GtmOnRails
  module TagHelper
    def render_gtm_on_rails_tag
      tags = []
      tags << render(partial: 'gtm_on_rails/layouts/data_layer_tag')
      tags << render(partial: 'gtm_on_rails/layouts/google_tag_manager_tag')
      tags.join.html_safe
    end
  end
end
