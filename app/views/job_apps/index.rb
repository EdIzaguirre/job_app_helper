# frozen_string_literal: true

class Views::JobApps::Index < Views::Base
  def initialize(user:)
    @user = user
  end

  def view_template
    Components::Layout(title: "Job Apps") do
      h1(class: "text-3xl font-bold my-4") { "All Job Applications" }
      unless @user
        h2 { "Create User" }
        a(href: new_user_path, class: "btn") { "Create User" }
      else
        h2 { "Current User: #{@user.name}" }
      end
      div(class: "overflow-x-auto rounded-box border border-base-content/5 bg-base-100 my-4") do
        table(class: "table table-zebra") do
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
      end
      br
      a(href: new_job_app_path, class: "btn btn-primary") { "Start new job app" }
    end
  end
end
