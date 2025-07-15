# frozen_string_literal: true

class Views::JobApps::New < Views::Base
  def initialize(job_app:)
    @job_app = job_app
  end

  def view_template
    Layout(title: "Job Apps") do
      h1(class: "text-3xl font-bold my-4") { "Create a new job app" }
      form_with model: @job_app do |form|
        fieldset(class: "fieldset") do
          form.label :company_name, class: "label"
          form.text_field :company_name, class: "input"
        end

        fieldset(class: "fieldset") do
          form.label :title, class: "label"
          form.text_field :title, class: "input"
        end

        fieldset(class: "fieldset") do
          form.label :description, class: "label"
          form.textarea :description, class: "input"
        end

        form.submit(class: "btn btn-primary")
      end
    end
  end
end
