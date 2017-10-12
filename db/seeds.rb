#Hotel.destroy_all
#Destination.destroy_all #Must be after Hotel
#Holiday.destroy_all
#User.destroy_all
#Search.destroy_all

require_relative 'destination' #Must be before Hotel
require_relative 'hotel'
require_relative 'user'
require_relative 'search'
require_relative 'holiday' #Must be after User and Search
