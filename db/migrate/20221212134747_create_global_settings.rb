class CreateGlobalSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :global_settings do |t|
      t.string :university_name
      t.string :university_city
      t.string :university_country
      t.string :university_email
      t.string :university_phone
      t.string :university_website
      t.string :university_twitter
      t.string :university_facebook
      t.string :university_telegram
      t.integer :allowed_pi_per_year
      t.integer :allowed_co_per_year
      t.string :date_format
      t.integer :minimum_password_length
      t.string :default_password

      t.timestamps
    end
  end
end
