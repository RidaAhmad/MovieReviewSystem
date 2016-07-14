ActiveAdmin.register User do

  permit_params :list, :of, :attributes, :on, :model, :id, :email, :encrypted_password, :password, attachments_attributes: [:id, :image, :_destroy]

  menu priority: 2

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.object.build_attachment unless f.object.attachment
      f.inputs 'Profile Picture', for: [:attachment, f.object.attachment] do |profile_picture|
        profile_picture.input :image, as: :file, hint: profile_picture.template.image_tag(profile_picture.object.image.url(:thumb))
      end
    end
    f.actions
  end

  index do
    id_column
    column :email, sortable: :email
    column :encrypted_password
    actions
  end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :encrypted_password
      row :created_at
      row :updated_at
      row 'Profile Picture' do |pic|
        div do
          image_tag(pic.attachment.image.url(:thumb)) if pic.attachment.present?
        end
      end
    end
    active_admin_comments
  end

end
