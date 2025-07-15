# frozen_string_literal: true

class Views::JobApps::Edit < Views::Base
  def initialize(job_app:)
    @job_app = job_app
  end

  def view_template
    Layout(title: "Edit Job Apps") do
      h1(class: "text-3xl font-bold my-4") { "Edit job app" }
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

        form.submit(class: "btn btn-soft btn-primary my-1")
      end

      link_to "Back to Job Apps", job_apps_path, class: "btn btn-soft btn-secondary my-1"
      button_to(job_app_path(@job_app), method: :delete, class: "btn btn-soft btn-error my-1", data: { confirm: "Are you sure you want to delete this job application?" }) { "Delete Job App" }
    end
  end
end
