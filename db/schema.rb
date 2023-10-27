# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_231_027_212_020) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'academic_ranks', force: :cascade do |t|
    t.string 'name'
    t.integer 'order_key'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_academic_ranks_on_name', unique: true
  end

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'calls', force: :cascade do |t|
    t.string 'title'
    t.boolean 'published'
    t.date 'deadline'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'code'
    t.index ['code'], name: 'index_calls_on_code', unique: true
    t.index ['user_id'], name: 'index_calls_on_user_id'
  end

  create_table 'departments', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_departments_on_name', unique: true
  end

  create_table 'documents', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_documents_on_user_id'
  end

  create_table 'education_levels', force: :cascade do |t|
    t.string 'name'
    t.integer 'order_key'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_education_levels_on_name', unique: true
  end

  create_table 'faculties', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_faculties_on_name', unique: true
  end

  create_table 'global_settings', force: :cascade do |t|
    t.string 'university_name'
    t.string 'university_city'
    t.string 'university_country'
    t.string 'university_email'
    t.string 'university_phone'
    t.string 'university_website'
    t.string 'university_twitter'
    t.string 'university_facebook'
    t.string 'university_telegram'
    t.integer 'allowed_pi_per_year'
    t.integer 'allowed_co_per_year'
    t.string 'date_format'
    t.integer 'minimum_password_length'
    t.string 'default_password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'members', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'proposal_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role', default: 0
    t.integer 'status', default: 0
    t.index ['proposal_id'], name: 'index_members_on_proposal_id'
    t.index ['user_id'], name: 'index_members_on_user_id'
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'phone_number'
    t.string 'id_number'
    t.bigint 'academic_rank_id'
    t.text 'about'
    t.string 'prefix'
    t.bigint 'faculty_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['academic_rank_id'], name: 'index_profiles_on_academic_rank_id'
    t.index ['faculty_id'], name: 'index_profiles_on_faculty_id'
  end

  create_table 'proposals', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'title'
    t.string 'attachement'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'abstract'
    t.bigint 'research_type_id', null: false
    t.bigint 'call_id'
    t.integer 'status', default: 0
    t.integer 'budget'
    t.bigint 'theme_id', null: false
    t.string 'code'
    t.index ['call_id'], name: 'index_proposals_on_call_id'
    t.index ['code'], name: 'index_proposals_on_code', unique: true
    t.index ['research_type_id'], name: 'index_proposals_on_research_type_id'
    t.index ['theme_id'], name: 'index_proposals_on_theme_id'
    t.index ['user_id'], name: 'index_proposals_on_user_id'
  end

  create_table 'research_centers', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'research_types', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'call_based'
    t.integer 'max_budget'
    t.integer 'gender', default: 2
    t.integer 'fund_source', default: 0
    t.integer 'min_researcher'
    t.integer 'max_duration'
    t.integer 'possible_extension'
    t.index ['name'], name: 'index_research_types_on_name', unique: true
  end

  create_table 'subscribers', force: :cascade do |t|
    t.string 'email'
    t.boolean 'active', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'subscription_hash'
    t.index ['email'], name: 'index_subscribers_on_email', unique: true
  end

  create_table 'themes', force: :cascade do |t|
    t.bigint 'research_center_id', null: false
    t.bigint 'user_id', null: false
    t.string 'title'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['research_center_id'], name: 'index_themes_on_research_center_id'
    t.index ['user_id'], name: 'index_themes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'first_name'
    t.string 'middle_name'
    t.string 'last_name'
    t.integer 'sex', default: 0
    t.string 'role', default: 'researcher'
    t.bigint 'profile_id'
    t.string 'color'
    t.bigint 'research_center_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['profile_id'], name: 'index_users_on_profile_id'
    t.index ['research_center_id'], name: 'index_users_on_research_center_id'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'calls', 'users'
  add_foreign_key 'documents', 'users'
  add_foreign_key 'members', 'proposals'
  add_foreign_key 'members', 'users'
  add_foreign_key 'profiles', 'academic_ranks'
  add_foreign_key 'profiles', 'faculties'
  add_foreign_key 'proposals', 'calls'
  add_foreign_key 'proposals', 'research_types'
  add_foreign_key 'proposals', 'themes'
  add_foreign_key 'proposals', 'users'
  add_foreign_key 'themes', 'research_centers'
  add_foreign_key 'themes', 'users'
  add_foreign_key 'users', 'profiles'
  add_foreign_key 'users', 'research_centers'
end
