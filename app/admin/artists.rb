ActiveAdmin.register Artist do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :artist_id, :name, :url, :image_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:artist_id, :name, :url, :image_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :artist_id, :name, :url, :image_url, :image
  
  filter :artist_id
  filter :name
  filter :url
  filter :image_blob_id, as: :string  # Ensure to filter by image_blob_id

  form do |f|
    f.inputs do
      f.input :artist_id
      f.input :name
      f.input :url
      f.input :image_url
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    column :artist_id
    column :name
    column :url
    column :image do |artist|
      if artist.image.attached?
        image_tag url_for(artist.image), height: '100'
      else
        'No Image'
      end
    end

    actions
  end
end