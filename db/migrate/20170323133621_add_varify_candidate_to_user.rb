class AddVarifyCandidateToUser < ActiveRecord::Migration
  def change
    add_column :users, :varify_candidate, :boolean, :default => false
  end
end
