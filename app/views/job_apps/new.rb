# frozen_string_literal: true

class Views::JobApps::New < Views::Base
  def initialize(job_app:)
    @job_app = job_app
  end

  def view_template
    Layout(title: "Job Apps") do
      h1 { "Create a new job app" }
      form_with model: @job_app do |form|
        div do
          form.label :company_name
          form.text_field :company_name
        end

        div do
          form.label :title
          form.textarea :title
        end

        div do
          form.label :description
          form.textarea :description
        end

        form.submit
      end
    end
  end
end
