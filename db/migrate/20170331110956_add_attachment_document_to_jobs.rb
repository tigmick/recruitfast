class AddAttachmentDocumentToJobs < ActiveRecord::Migration
  def self.up
    change_table :jobs do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :jobs, :document
  end
end
