class RemoveFieldsFromShareAStats < ActiveRecord::Migration
  def change
    change_table(:share_a_stats) do |t|
      t.remove :scholarship
      t.remove :campaign_id
      t.remove :logo
      t.remove :logo_text
      t.remove :shortform_image
      t.remove :shortform_bucket
      t.remove :sponsor_image
      t.remove :logo_file_name
      t.remove :logo_content_type
      t.remove :logo_file_size
      t.remove :logo_updated_at
      t.remove :shortform_image_file_name
      t.remove :shortform_image_content_type
      t.remove :shortform_image_file_size
      t.remove :shortform_image_updated_at
      t.remove :sponsor_image_file_name
      t.remove :sponsor_image_content_type
      t.remove :sponsor_image_file_size
      t.remove :sponsor_image_updated_at
    end
  end
end
