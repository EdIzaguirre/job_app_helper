# frozen_string_literal: true

class Views::JobApps::Show < Views::Base
  def initialize(job_app:)
    @job_app = job_app
  end

  def view_template
    Layout(title: "Show Job App") do
      h1(class: "text-3xl font-bold my-4") { "Show job app" }
      link_to(root_path, class: "btn btn-soft btn-warning my-1") { "Cancel" }
      p {@job_app.company_name} 
      p {@job_app.title} 
      p {@job_app.description} 
      
      link_to(edit_job_app_path(@job_app), class: "btn btn-soft btn-primary") { "Edit" } 
    end
  end
end
