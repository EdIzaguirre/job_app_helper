class Components::H2Component < Phlex::HTML
   def initialize(text:)
     @text = text
   end

   def view_template 
     h2(class: "text-2xl font-semibold text-gray-800 leading-tight tracking-tight my-4") {@text}
   end
end
