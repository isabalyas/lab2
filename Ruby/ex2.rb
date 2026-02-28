def transform_email(email)
  result = ''
  i = 0

  while i < email.length && email[i] != '@' do
    if email[i] == '*'
      while i + 1 < email.length && email[i + 1] != '@'
        i += 1
      end
      i += 1
    elsif email[i].match?(/[a-zA-Z0-9]/)
      result << email[i]
    end
    i += 1
  end

  while i < email.length
    result << email[i]
    i += 1
  end

  result
end

def main
  n = gets.to_i

  emails = Set.new

  n.times do |i|
    email = gets.chomp
    transformed = transform_email(email)
    emails.add(transformed)
  end

  puts "#{emails.size}"
end

main