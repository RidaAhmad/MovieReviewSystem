ActiveAdmin.register Review do

  permit_params :list, :of, :attributes, :on, :model, :comment, :report_count, :movie_id, :user_id

  menu priority: 4

  form do |f|
    f.inputs do
      f.input :movie
      f.input :user_id, as: :select, collection: User.all.map{ |user| [user.email, user.id] }
      f.input :comment
      f.input :report_count
    end
    f.actions
  end

  index do
    id_column
    column :movie, sortable: :movie_id
    column :user, sortable: :user_id
    column :comment
    column :report_count
    actions
  end

  show do |review|
    attributes_table do
      row :movie
      row :user
      row :comment
      row :report_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end


end
