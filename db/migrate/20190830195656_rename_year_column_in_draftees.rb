class RenameYearColumnInDraftees < ActiveRecord::Migration[6.0]
  def change
    rename_column :draftees, :year, :draft_position
  end
end
