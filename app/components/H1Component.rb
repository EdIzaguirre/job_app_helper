class Components::H1Component < Phlex::HTML
   def initialize(text:)
     @text = text
   end

   def view_template 
     h1(class: "text-3xl font-bold text-gray-900") {@text}
   end
end
