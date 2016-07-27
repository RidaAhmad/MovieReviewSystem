ThinkingSphinx::Index.define :movie, with: :active_record, delta: true do
  indexes title, sortable: true
  indexes genre, sortable: true
  indexes actors.name, as: :actor_name, sortable: true
  indexes description

  has release_date
  has updated_at
  has approved
end
