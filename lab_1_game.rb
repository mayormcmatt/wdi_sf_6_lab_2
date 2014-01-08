# Lab 2: Choose Your Own Adventure
# Hint: find method that allow finding a hash key
# Hint: look between identifiers


# #Tim's Base
pages_with_q = {} # new hash

lines_grabbed = ""
key = ""

puts "Ohayou gozaimasu!"
puts
File.open("story.txt", "r") do |infile| # opens story.txt with read
# iterates within file
	while (line = infile.gets) #assigns line to reading of lines
		# if the following line is false
		if line.index("~p") # index finds first thing on line, in this case ~p
			key = line # assigns the line, the ~p, to key var
			lines_grabbed = "" # assigns this var inside loop (local)
		# else it runs the following, which increments down lines
		else
			lines_grabbed += line
		end
		pages_with_q[key] = lines_grabbed
	end
end

p1 = pages_with_q.select do |k, v|
	k.index("~p1")
end

p1.each {|k, v| puts v}

puts "Which do you want to do? (1, 2 or 3)"
choice = gets.to_i

p_ = pages_with_q.select do |k, v|
	k.index("~p#{choice + 1}")
end

p_.each {|k, v| puts v}

#insert code that prints out the story
#possibly output to arrays, convert arrays to strings(?)
File.open("story_out.txt", "w") do |text|
	text.puts p1, p_
end

puts "Play again for another eggy outcome!"
