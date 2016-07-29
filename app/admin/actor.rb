ActiveAdmin.register Actor do

  permit_params :list, :of, :attributes, :on, :model, :name, :bio, :gender

  menu priority: 5

  form do |f|
    f.inputs do
      f.input :name
      f.input :bio
      f.input :gender, as: :select, collection: Actor::GENDERS.map {|gender| [gender.titleize, gender]}, include_blank: false
    end
    f.actions
  end

  filter :movies
  filter :name, as: :select, collection: Actor.all.map{ |actor| [actor.name, actor.id] }
  filter :gender, as: :select, collection: Actor::GENDERS.map {|gender| [gender.titleize, gender]}

end
