# frozen_string_literal: true

class Views::Users::Edit < Views::Base
  def initialize(user:)
    @user = user
  end

  def view_template
    Layout(title: "Edit Users") do
      render Components::H1Component.new(text: "Edit User")
      link_to(root_path, class: "btn btn-soft btn-warning my-1") { "Cancel" }
      form_with model: @user do |form|
        fieldset(class: "fieldset") do
          form.label :name, class: "label"
          form.text_field :name, class: "input"
        end

        fieldset(class: "fieldset") do
          form.label :bio, class: "label"
          form.text_field :bio, class: "input"
        end

        fieldset(class: "fieldset") do
          form.label :resume, class: "label"
          form.textarea :resume, class: "input"
        end

        form.submit(class: "btn btn-soft btn-primary my-1")
      end
      button_to(user_path(@user), method: :delete, class: "btn btn-soft btn-error my-1", data: { confirm: "Are you sure you want to delete this user?" }) { "Delete User" }
    end
  end
end
