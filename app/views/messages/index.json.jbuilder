json.messages @messages.each do |message|
  json.name  message.user.name
  json.date   message.created_at("%Y/%m/%d %H:%M:%S")
  json.text   message.text
  json.image   message.image
  json.id   message.id
end
