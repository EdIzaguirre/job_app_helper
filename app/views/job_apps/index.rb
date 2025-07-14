# frozen_string_literal: true

class Views::JobApps::Index < Views::Base
  def initialize(user:)
    @user = user
  end

  def view_template
    Layout(title: "Job Apps") do
      h1 { "All Job Applications" }
      unless @user
        h2 { "Create User" }
        a(href: new_user_path) { "Create User" }
      else
        h2 { "Current User: #{@user.name}" }
      end

      table do
        tr do
          th { "Company Name" }
          th { "Title" }
          th { "Description" }
        end

        for app in @user.job_apps do
          tr do
            td { app.company_name }
            td { app.title }
            td { app.description }
          end
        end
      end
      br
      a(href: new_job_app_path) { "Start new job app" }
    end
  end
end
