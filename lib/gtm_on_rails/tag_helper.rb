module GtmOnRails
  module TagHelper
    def render_gtm_on_rails_tag_in_head
      tags = []
      tags << render(partial: 'gtm_on_rails/layouts/data_layer_before_page_view_tag')
      tags << render(partial: 'gtm_on_rails/layouts/google_tag_manager_tag_in_head')
      tags.join.html_safe
    end

    def render_gtm_on_rails_tag_in_body
      tags = []
      tags << render(partial: 'gtm_on_rails/layouts/google_tag_manager_tag_in_body')
      tags << render(partial: 'gtm_on_rails/layouts/data_layer_tag')
      tags.join.html_safe
    end
  end
end
