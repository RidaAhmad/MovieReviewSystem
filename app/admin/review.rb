ActiveAdmin.register Review do

  permit_params :list, :of, :attributes, :on, :model, :comment, :movie_id, :user_id

  menu priority: 4

  form do |f|
    f.inputs do
      f.input :movie
      f.input :user_id, as: :select, collection: User.all.map{ |user| [user.email, user.id] }
      f.input :comment
    end
    f.actions
  end


  index do
    column :movie, sortable: :movie_id
    column :user, sortable: :user_id
    column :comment
    actions
  end

  show do |review|
    attributes_table do
      row :movie
      row :user
      row :comment
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end


end
