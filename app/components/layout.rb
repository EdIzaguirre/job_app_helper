class Components::Layout < Components::Base
  def initialize(title: nil)
    @title = title
  end

  def view_template
    doctype

    html do
      head do
        title { @title || "Job App Helper" }
        stylesheet_link_tag(:app, "data-turbo-track": "reload")
      end

      body { yield }
    end
  end
end
