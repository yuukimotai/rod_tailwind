# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :posts do
      primary_key :id #投稿自体の連番id
      column :uuid, String, null: false, default: Sequel.function(:gen_random_uuid)
      column :title, String, null: false
      column :content, String
    end
  end
end
