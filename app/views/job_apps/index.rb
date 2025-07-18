# frozen_string_literal: true

class Views::JobApps::Index < Views::Base
  def initialize(user:)
    @user = user
  end

  def view_template
    Components::Layout(title: "Job Apps") do
      render Components::H1Component.new(text: "All Job Apps")
      unless @user
        render Components::H2Component.new(text: "Create User")
        link_to(new_user_path, class: "btn") { "Create User" }
      else
        render Components::H2Component.new(text: "Current User: #{@user.name}")
        link_to(edit_user_path(@user), class: "btn") { "Edit User" }
      end
      div(class: "overflow-x-auto rounded-box border border-base-content/5 bg-base-100 my-4") do
        table(class: "table table-zebra") do
          tr do
            th { "Company Name" }
            th { "Title" }
            th { "Description" }
            th { "" }
          end

          for app in @user.job_apps do
            tr do
              td { app.company_name }
              td { app.title }
              td { app.description }
              td { link_to(job_app_path(app), class: "btn btn-soft btn-primary") { "Show" } }
            end
          end
        end
      end
      br
      link_to(new_user_job_app_path(@user), class: "btn btn-soft btn-primary") { "Start new job app" }
    end
  end
end
