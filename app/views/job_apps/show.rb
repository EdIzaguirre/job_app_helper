# frozen_string_literal: true

class Views::JobApps::Show < Views::Base
  def initialize(job_app:)
    @job_app = job_app
  end

  def view_template
    Layout(title: "Show Job App") do
      render Components::H1Component.new(text: "Show job app")
      link_to(root_path, class: "btn btn-soft btn-warning my-1") { "Cancel" }
      render Components::H2Component.new(text: "Company Name")
      p {@job_app.company_name} 
      br
      render Components::H2Component.new(text: "Job Title")
      p {@job_app.title} 
      br
      render Components::H2Component.new(text: "Job Description")
      p {@job_app.description} 
      link_to(edit_job_app_path(@job_app), class: "btn btn-soft btn-primary") { "Edit" } 
    end
  end
end
