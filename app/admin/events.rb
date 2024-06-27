ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :event_id, :name, :url, :date_time, :venue_id, :image_url, :info, :min_price, :max_price
  #
  # or
  #
  # permit_params do
  #   permitted = [:event_id, :name, :url, :date_time, :venue_id, :image_url, :info, :min_price, :max_price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
