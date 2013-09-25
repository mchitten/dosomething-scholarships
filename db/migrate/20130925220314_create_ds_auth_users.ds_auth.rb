# This migration comes from ds_auth (originally 20130925215928)
class CreateDsAuthUsers < ActiveRecord::Migration
  def change
    create_table :ds_auth_users do |t|
      t.string :email
      t.integer :fbid
      t.integer :uid
      t.boolean :is_admin
      t.string :mobile
      t.string :signup_type

      t.timestamps
    end
  end
end
