module ServerStatesHelper

	def status(addr)
    output = `ping -c 3 #{addr}`
    if output.include? "100% packet loss"
      "Der Server ist down :("
    else
      "Der Server rennt wie erwartet!"
    end
  end
  
end
