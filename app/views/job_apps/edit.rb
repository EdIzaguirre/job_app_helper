# frozen_string_literal: true

class Views::JobApps::Edit < Views::Base
  def initialize(job_app:)
    @job_app = job_app
  end

  def view_template
    Layout(title: "Edit Job Apps") do
      render Components::H1Component.new(text: "Edit job app") 
      link_to(root_path, class: "btn btn-soft btn-warning my-1") { "Cancel" }
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

      button_to(job_app_path(@job_app), method: :delete, class: "btn btn-soft btn-error my-1", data: { confirm: "Are you sure you want to delete this job application?" }) { "Delete Job App" }
    end
  end
end
