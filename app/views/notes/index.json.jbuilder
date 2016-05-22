json.array!(@notes) do |note|
  json.extract! note, :id, :content, :user_id
  json.url note_url(note, format: :json)
end
