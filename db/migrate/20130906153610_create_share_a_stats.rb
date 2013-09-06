class CreateShareAStats < ActiveRecord::Migration
  def change
    create_table :share_a_stats do |t|
      t.string :title
      t.text :message
      t.string :image
      t.boolean :scholarship
      t.string :tip
      t.integer :mc_alpha
      t.integer :mc_beta
      t.string :redirect
      t.text :redirect_message
      t.integer :campaign_id
      t.string :color_scheme
      t.string :logo
      t.string :logo_text
      t.string :shortform_image
      t.string :shortform_bucket
      t.string :sponsor_image
      t.boolean :published

      t.timestamps
    end
  end
end
