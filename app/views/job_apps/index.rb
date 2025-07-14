# frozen_string_literal: true

class Views::JobApps::Index < Views::Base
  def initialize(user:)
    @user = user
  end

  def view_template
    Layout(title: "Job Apps") do
      # h1 { "All Job Applications" }
      h1(class: "text-3xl font-bold underline") { "All Job Applications" }
      unless @user
        h2 { "Create User" }
        a(href: new_user_path) { "Create User" }
      else
        h2 { "Current User: #{@user.name}" }
      end

      Table do
        TableHeader do
          TableRow do
          TableHead  { "Company Name" }
          TableHead { "Title" }
          TableHead { "Description" }
          end
        end

        for app in @user.job_apps do
          TableRow do
            TableCell { app.company_name }
            TableCell { app.title }
            TableCell { app.description }
          end
        end
      end
      br
      a(href: new_job_app_path) { "Start new job app" }
    end
  end
end
