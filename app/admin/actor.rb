ActiveAdmin.register Actor do

  permit_params :list, :of, :attributes, :on, :model, :name, :bio, :gender, attachments_attributes: [:id, :image, :_destroy]

  menu priority: 5

  form html: { enctype: 'multipart/form-data'} do |f|
    f.inputs do
      f.input :name
      f.input :bio
      f.input :gender, as: :select, collection: Actor::GENDERS.map {|gender| [gender.titleize, gender]}, include_blank: false
      f.has_many :attachments, allow_destroy: true do |attachment|
        attachment.input :image, hint: attachment.template.image_tag(attachment.object.image.url(:thumb))
      end
    end
    f.actions
  end

  index do
    id_column
    column :name, sortable: :title
    column :gender
    column :bio
    column 'Pictures' do |actor|
      div do
        actor.attachments.each do |picture|
          span do
            image_tag(picture.image.url(:thumb))
          end
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :gender
      row :bio
      if actor.attachments.present?
        row :pictures do
          div do
            actor.attachments.each do |attachment|
              div do
                image_tag(attachment.image.url(:thumb))
              end
            end
          end
        end
      end
    end
  end

  filter :movies
  filter :name, as: :select, collection: Actor.all.map{ |actor| [actor.name, actor.id] }
  filter :gender, as: :select, collection: Actor::GENDERS.map {|gender| [gender.titleize, gender]}

end
