class Timer
	attr_accessor :seconds
	
	def initialize
		@seconds = 0
	end

	def pad(i)
		i = i.to_s
		if i.length == 1
			i = "0" + i
		else
			i
		end
	end
	
	def time_string
		minutes = @seconds/60
		hours = minutes/60
		s= pad(hours) + ":" + pad(minutes - hours*60) + ":" + pad(@seconds - minutes*60)
	end
end