class RenameMyTable < ActiveRecord::Migration
    def change
        rename_table :api_keys, :sessions
    end
end
