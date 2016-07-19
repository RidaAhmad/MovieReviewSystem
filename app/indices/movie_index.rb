ThinkingSphinx::Index.define :movie, with: :active_record do
  indexes title, sortable: true
  indexes genre, sortable: true
  indexes approved
  indexes actors.name, as: :actor_name, sortable: true
  indexes release_date

  has updated_at
end
