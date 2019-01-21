require 'csv'

def clean_zipcode(zipcode)
    # If the zipcode is missing, add in the placeholder missing code of "00000".
    if zipcode.nil?
        zipcode = "00000"
    # If the zipcode is shorter than five digits, add zeros to the front. (Assume New England address.)
    elsif zipcode.length < 5
        zipcode = zipcode.rjust(5,"0")
    # If the zipcode is longer than five digits, truncate to the first five digits.
    elsif zipcode.length > 5
        zipcode = zipcode[0..4]
    # If the zipcode is five digits long, assume that it's fine.
    else
        zipcode
    end
end


puts "Event Manager Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    puts "#{name} #{zipcode}"
end