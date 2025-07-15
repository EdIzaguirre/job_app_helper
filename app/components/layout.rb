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
      body do
        div(class: "container mx-auto px-4 max-w-6xl py-8") do
          yield
        end
      end
    end
  end
end
