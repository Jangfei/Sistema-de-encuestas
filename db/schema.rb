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

ActiveRecord::Schema.define(:version => 20130424094327) do

  create_table "answers", :force => true do |t|
    t.text     "descripcion"
    t.integer  "resolved_survey_id"
    t.integer  "question_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "section_id"
  end

  create_table "options", :force => true do |t|
    t.string   "descripcion"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_types", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "descripcion"
    t.integer  "question_type_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "questions_sections", :id => false, :force => true do |t|
    t.integer "question_id"
    t.integer "section_id"
  end

  add_index "questions_sections", ["question_id", "section_id"], :name => "index_questions_sections_on_question_id_and_section_id", :unique => true

  create_table "resolved_surveys", :force => true do |t|
    t.date     "fecha_resolucion"
    t.integer  "survey_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections_surveys", :id => false, :force => true do |t|
    t.integer "survey_id"
    t.integer "section_id"
  end

  add_index "sections_surveys", ["survey_id", "section_id"], :name => "index_sections_surveys_on_survey_id_and_section_id", :unique => true

  create_table "surveys", :force => true do |t|
    t.string   "nombre_encuesta"
    t.date     "fecha_creacion"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.date     "fecha_nac"
    t.string   "user_name"
    t.string   "password"
    t.string   "ciudad"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
