module ApplicationHelper

  def display_errors(host)
   if host.errors.any?
    host.errors.full_messages.each do |message|
       message
     end
   end
 end
end
