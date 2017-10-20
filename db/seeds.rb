# frozen_string_literal: true

ref = Time.now

puts '*****************************************'
puts 'Wiping existing database data ...'

#Hotel.destroy_all
#Destination.destroy_all # Must be after Hotel
#Holiday.destroy_all
User.destroy_all
#Search.destroy_all
#LoginHistory.destroy_all

time_to_do = (Time.now - ref).round(2)
puts "Database data wiped in #{time_to_do}s"
puts "*****************************************\n\n"
ref = Time.now
puts '*****************************************'
puts 'Re-creating Destination / Hotel Data ...'

#require_relative 'destination' # Must be before Hotel
#require_relative 'hotel'

time_to_do = (Time.now - ref).round(2)
puts "Destination / Hotel data created: #{time_to_do}s"
puts "*****************************************\n\n"
ref = Time.now
puts '*****************************************'
puts 'Re-creating User / Login History Data ...'

require_relative 'user'
#require_relative 'login_history'

time_to_do = (Time.now - ref).round(2)
puts "User / Login History data created: #{time_to_do}s"
puts "*****************************************\n\n"
ref = Time.now
puts '*****************************************'
puts 'Re-creating Search / Holiday Data ...'

#require_relative 'search' # Must be after Destination/Hotel
#require_relative 'holiday' # Must be after User and Search

time_to_do = (Time.now - ref).round(2)
puts "Search / Holiday data created: #{time_to_do}s"
puts "*****************************************\n\n"

#puts "#{Hotel.count} Hotels Created in #{Destination.count} Locations."
puts "#{User.count} Users created with #{LoginHistory.count} historical login records."
#puts "#{Search.count} Searches performed, with #{Holiday.count} being turned into Holidays."
