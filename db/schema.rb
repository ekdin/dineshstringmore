# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160708065435) do

  create_table "answers", force: :cascade do |t|
    t.integer  "club_question_id",        limit: 4
    t.integer  "user_id",                 limit: 4
    t.string   "answer",                  limit: 255
    t.integer  "status",                  limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "answer_pic_file_name",    limit: 255
    t.string   "answer_pic_content_type", limit: 255
    t.integer  "answer_pic_file_size",    limit: 4
    t.datetime "answer_pic_updated_at"
  end

  add_index "answers", ["club_question_id"], name: "index_answers_on_club_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "club_questions", force: :cascade do |t|
    t.integer  "club_id",                   limit: 4
    t.integer  "user_id",                   limit: 4
    t.string   "content",                   limit: 255
    t.integer  "status",                    limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "question_pic_file_name",    limit: 255
    t.string   "question_pic_content_type", limit: 255
    t.integer  "question_pic_file_size",    limit: 4
    t.datetime "question_pic_updated_at"
  end

  add_index "club_questions", ["club_id"], name: "index_club_questions_on_club_id", using: :btree
  add_index "club_questions", ["user_id"], name: "index_club_questions_on_user_id", using: :btree

  create_table "clubs", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "description",           limit: 255
    t.integer  "interest_id",           limit: 4
    t.integer  "user_id",               limit: 4
    t.integer  "status",                limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "club_pic_file_name",    limit: 255
    t.string   "club_pic_content_type", limit: 255
    t.integer  "club_pic_file_size",    limit: 4
    t.datetime "club_pic_updated_at"
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "story_id",                 limit: 4
    t.string   "content",                  limit: 255
    t.string   "content_type",             limit: 255
    t.integer  "position",                 limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "content_pic_file_name",    limit: 255
    t.string   "content_pic_content_type", limit: 255
    t.integer  "content_pic_file_size",    limit: 4
    t.datetime "content_pic_updated_at"
  end

  add_index "contents", ["content"], name: "index_contents_on_content", using: :btree
  add_index "contents", ["content_type"], name: "index_contents_on_content_type", using: :btree
  add_index "contents", ["position"], name: "index_contents_on_position", using: :btree
  add_index "contents", ["story_id"], name: "index_contents_on_story_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "following_id", limit: 4, null: false
    t.integer  "follower_id",  limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree
  add_index "follows", ["following_id", "follower_id"], name: "index_follows_on_following_id_and_follower_id", unique: true, using: :btree
  add_index "follows", ["following_id"], name: "index_follows_on_following_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "title",                     limit: 255
    t.integer  "status",                    limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "interest_pic_file_name",    limit: 255
    t.string   "interest_pic_content_type", limit: 255
    t.integer  "interest_pic_file_size",    limit: 4
    t.datetime "interest_pic_updated_at"
  end

  create_table "rating_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "rating_categories", ["name"], name: "index_rating_categories_on_name", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.integer  "role_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "stories", force: :cascade do |t|
    t.integer  "user_id",                limit: 4
    t.integer  "club_id",                limit: 4
    t.string   "title",                  limit: 255
    t.integer  "status",                 limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "story_pic_file_name",    limit: 255
    t.string   "story_pic_content_type", limit: 255
    t.integer  "stroy_pic_file_size",    limit: 4
    t.datetime "stroy_pic_updated_at"
  end

  add_index "stories", ["club_id"], name: "index_stories_on_club_id", using: :btree
  add_index "stories", ["title"], name: "index_stories_on_title", using: :btree
  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "story_comments", force: :cascade do |t|
    t.integer  "story_id",                 limit: 4
    t.integer  "user_id",                  limit: 4
    t.string   "comment",                  limit: 255
    t.integer  "status",                   limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "comment_pic_file_name",    limit: 255
    t.string   "comment_pic_content_type", limit: 255
    t.integer  "comment_pic_file_size",    limit: 4
    t.datetime "comment_pic_updated_at"
  end

  add_index "story_comments", ["story_id"], name: "index_story_comments_on_story_id", using: :btree
  add_index "story_comments", ["user_id"], name: "index_story_comments_on_user_id", using: :btree

  create_table "story_ratings", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "story_id",         limit: 4
    t.integer  "rate_category_id", limit: 4
    t.integer  "rate",             limit: 4
    t.string   "type",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "story_ratings", ["rate"], name: "index_story_ratings_on_rate", using: :btree
  add_index "story_ratings", ["rate_category_id"], name: "index_story_ratings_on_rate_category_id", using: :btree
  add_index "story_ratings", ["story_id"], name: "index_story_ratings_on_story_id", using: :btree
  add_index "story_ratings", ["user_id"], name: "index_story_ratings_on_user_id", using: :btree

  create_table "user_clubs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "club_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_clubs", ["club_id"], name: "index_user_clubs_on_club_id", using: :btree
  add_index "user_clubs", ["user_id", "club_id"], name: "index_user_clubs_on_user_id_and_club_id", unique: true, using: :btree
  add_index "user_clubs", ["user_id"], name: "index_user_clubs_on_user_id", using: :btree

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "interest_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_ratings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "story_id",   limit: 4
    t.string   "post_type",  limit: 255
    t.integer  "rate",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "user_ratings", ["rate"], name: "index_user_ratings_on_rate", using: :btree
  add_index "user_ratings", ["story_id"], name: "index_user_ratings_on_story_id", using: :btree
  add_index "user_ratings", ["user_id"], name: "index_user_ratings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uname",                         limit: 255, default: "", null: false
    t.string   "email",                         limit: 255, default: "", null: false
    t.string   "encrypted_password",            limit: 255, default: "", null: false
    t.string   "reset_password_token",          limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                 limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",            limit: 255
    t.string   "last_sign_in_ip",               limit: 255
    t.string   "confirmation_token",            limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",             limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "name",                          limit: 255
    t.string   "bio",                           limit: 255
    t.string   "mobile",                        limit: 255
    t.string   "address",                       limit: 255
    t.string   "city",                          limit: 255
    t.string   "state",                         limit: 255
    t.string   "country",                       limit: 255
    t.string   "user_profile_pic_file_name",    limit: 255
    t.string   "user_profile_pic_content_type", limit: 255
    t.integer  "user_profile_pic_file_size",    limit: 4
    t.datetime "user_profile_pic_updated_at"
    t.string   "user_cover_pic_file_name",      limit: 255
    t.string   "user_cover_pic_content_type",   limit: 255
    t.integer  "user_cover_pic_file_size",      limit: 4
    t.datetime "user_cover_pic_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uname"], name: "index_users_on_uname", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id",   limit: 4
    t.string   "votable_type", limit: 255
    t.integer  "voter_id",     limit: 4
    t.string   "voter_type",   limit: 255
    t.boolean  "vote_flag"
    t.string   "vote_scope",   limit: 255
    t.integer  "vote_weight",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "identities", "users"
end
