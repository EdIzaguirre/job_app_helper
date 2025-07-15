# frozen_string_literal: true

class Views::Users::New < Views::Base
  def initialize(user:)
    @user = user
  end

  def view_template
    Layout(title: "Create User") do
      h1(class: "text-3xl font-bold my-4") { "Create user" }
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

        form.submit(class: "btn btn-soft btn-primary my-4")
      end
    end
  end
end
