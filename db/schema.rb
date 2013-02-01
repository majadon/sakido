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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130125602) do

  create_table "characters", :force => true do |t|
    t.integer  "jobid"
    t.integer  "weight"
    t.integer  "hpfactor"
    t.integer  "hpmultiplicator"
    t.integer  "spfactor"
    t.integer  "unarmed"
    t.integer  "dagger"
    t.integer  "oneh_sword"
    t.integer  "twoh_sword"
    t.integer  "oneh_spear"
    t.integer  "twoh_spear"
    t.integer  "oneh_axe"
    t.integer  "twoh_axe"
    t.integer  "oneh_mace"
    t.integer  "twoh_mace_unused"
    t.integer  "rod"
    t.integer  "bow"
    t.integer  "knuckle"
    t.integer  "instrument"
    t.integer  "whip"
    t.integer  "book"
    t.integer  "katar"
    t.integer  "revolver"
    t.integer  "rifle"
    t.integer  "gatling_gun"
    t.integer  "shotgun"
    t.integer  "grenade_launcher"
    t.integer  "fuuma_shuriken"
    t.integer  "twoh_staff"
    t.integer  "shield"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "jobname"
  end

  create_table "elements", :force => true do |t|
    t.integer  "element_id"
    t.string   "monster_element"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], :name => "index_forem_categories_on_slug", :unique => true

  create_table "forem_forums", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], :name => "index_forem_forums_on_slug", :unique => true

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "pending_review"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "locked",       :default => false,            :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "pending_review"
    t.integer  "views_count",  :default => 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], :name => "index_forem_topics_on_slug", :unique => true
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "items", :force => true do |t|
    t.integer  "itemid"
    t.string   "aegisname"
    t.string   "name"
    t.integer  "modeltype"
    t.integer  "buy"
    t.integer  "sell"
    t.integer  "weight"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "range"
    t.integer  "slots"
    t.string   "job"
    t.integer  "upper"
    t.integer  "gender"
    t.integer  "loc"
    t.integer  "wlv"
    t.integer  "elv"
    t.integer  "refineable"
    t.integer  "view"
    t.string   "script"
    t.string   "onequip_script"
    t.string   "onunequip_script"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "maps", :force => true do |t|
    t.string   "map_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "maps", ["map_id"], :name => "index_maps_on_map_id", :unique => true

  create_table "monster_items", :force => true do |t|
    t.integer  "monster_id"
    t.integer  "item_id"
    t.integer  "percent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "monster_items", ["item_id"], :name => "index_monster_items_on_item_id"
  add_index "monster_items", ["monster_id"], :name => "index_monster_items_on_monster_id"

  create_table "monster_spawns", :force => true do |t|
    t.integer  "monster_id"
    t.string   "spawn_id"
    t.integer  "amount"
    t.integer  "delay"
    t.integer  "variance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monstermodes", :force => true do |t|
    t.string   "mode_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monsters", :force => true do |t|
    t.integer  "mobid"
    t.string   "sprite_name"
    t.string   "kroname"
    t.string   "ironame"
    t.integer  "lv"
    t.integer  "hp"
    t.integer  "sp"
    t.integer  "exp"
    t.integer  "jexp"
    t.integer  "range1"
    t.integer  "atk1"
    t.integer  "atk2"
    t.integer  "def"
    t.integer  "mdef"
    t.integer  "str"
    t.integer  "agi"
    t.integer  "vit"
    t.integer  "int"
    t.integer  "dex"
    t.integer  "luk"
    t.integer  "range2"
    t.integer  "range3"
    t.integer  "scale_id"
    t.integer  "race_id"
    t.integer  "element_id"
    t.string   "mode"
    t.integer  "speed"
    t.integer  "adelay"
    t.integer  "amotion"
    t.integer  "dmotion"
    t.integer  "mexp"
    t.integer  "mvp1id"
    t.integer  "mvp1per"
    t.integer  "mvp2id"
    t.integer  "mvp2per"
    t.integer  "mvp3id"
    t.integer  "mvp3per"
    t.integer  "drop1id"
    t.integer  "drop1per"
    t.integer  "drop2id"
    t.integer  "drop2per"
    t.integer  "drop3id"
    t.integer  "drop3per"
    t.integer  "drop4id"
    t.integer  "drop4per"
    t.integer  "drop5id"
    t.integer  "drop5per"
    t.integer  "drop6id"
    t.integer  "drop6per"
    t.integer  "drop7id"
    t.integer  "drop7per"
    t.integer  "drop8id"
    t.integer  "drop8per"
    t.integer  "drop9id"
    t.integer  "drop9per"
    t.integer  "dropcardid"
    t.integer  "dropcardper"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "monsters", ["lv"], :name => "index_monsters_on_lv"

  create_table "monsterskills", :force => true do |t|
    t.integer  "mobid"
    t.string   "dummy_value"
    t.string   "state"
    t.integer  "skill_id"
    t.integer  "skill_lv"
    t.integer  "rate"
    t.integer  "casttime"
    t.integer  "delay"
    t.string   "cancelable"
    t.string   "target"
    t.string   "condition_type"
    t.string   "condition_value"
    t.integer  "val1"
    t.integer  "val2"
    t.integer  "val3"
    t.integer  "val4"
    t.integer  "val5"
    t.string   "emotion"
    t.string   "chat"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "mvp_items", :force => true do |t|
    t.integer  "monster_id"
    t.integer  "item_id"
    t.integer  "percent"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mvp_items", ["item_id"], :name => "index_mvp_items_on_item_id"
  add_index "mvp_items", ["monster_id"], :name => "index_mvp_items_on_monster_id"

  create_table "races", :force => true do |t|
    t.integer  "race_id"
    t.string   "monster_race"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scales", :force => true do |t|
    t.integer  "scale_id"
    t.string   "size"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spawns", :force => true do |t|
    t.string   "map_name"
    t.integer  "x_cord"
    t.integer  "y_cord"
    t.integer  "x2_cord"
    t.integer  "y2_cord"
    t.string   "monster_type"
    t.string   "name"
    t.integer  "mob_id"
    t.integer  "amount"
    t.integer  "delay"
    t.integer  "variance"
    t.integer  "event"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",               :null => false
    t.string   "encrypted_password",     :default => "",               :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "username"
    t.integer  "role_id"
    t.boolean  "forem_admin",            :default => false
    t.string   "forem_state",            :default => "pending_review"
    t.boolean  "forem_auto_subscribe",   :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
