ActiveAdmin.register Report do
  menu priority: 6

  filter :user_id, as: :select, collection: User.all.map{ |user| [user.email, user.id] }

end
