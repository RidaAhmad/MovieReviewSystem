ActiveAdmin.register Movie do

  permit_params :list, :of, :attributes, :on, :model, :title, :genre, :trailer, :release_date, :duration, :description, :featured, :approved, actor_ids: [], attachments_attributes: [:id, :image, :_destroy]

  menu priority: 3

  form html: { enctype: 'multipart/form-data'} do |f|
    f.inputs do
      f.input :title
      f.input :trailer
      f.input :release_date
      f.input :duration
      f.input :featured
      f.input :approved
      f.input :genre, as: :select, collection: Movie::GENRES.map {|genre| [genre.titleize, genre]}, include_blank: false
      f.input :actor_ids, as: :select, collection: Actor.all, include_blank: false, multiple: true
      f.input :description
      f.has_many :attachments, allow_destroy: true do |poster|
        poster.input :image, hint: poster.template.image_tag(poster.object.image.url(:thumb))
      end
    end
    f.actions
  end

  index do
    id_column
    column :title, sortable: :title
    column :genre
    column :trailer
    column :release_date
    column :duration
    column :featured
    column :approved
    column :genre
    column :actor_ids
    column 'Actors' do |movie|
      div do
        movie.actors.each do |actor|
          span do
            actor.name
          end
        end
      end
    end
    column 'Posters' do |movie|
      div do
        movie.attachments.each do |poster|
          span do
            image_tag(poster.image.url(:thumb))
          end
        end
      end
    end
    column :description
    actions
  end

  filter :title, as: :select, collection: Movie.all.map{ |movie| [movie.title, movie.id] }
  filter :genre, as: :select, collection: Movie::GENRES.map {|genre| [genre.titleize, genre]}
  filter :actors

end
