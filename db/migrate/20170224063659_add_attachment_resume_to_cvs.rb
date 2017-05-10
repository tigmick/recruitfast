class AddAttachmentResumeToCvs < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :cv
    end
  end

  def self.down
    remove_attachment :resumes, :cv
  end
end
