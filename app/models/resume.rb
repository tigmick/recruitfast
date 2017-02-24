class Resume < ActiveRecord::Base
  belongs_to :user

  has_attached_file :cv,
  :url  => "/assets/resumes/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/resumes/:id/:style/:basename.:extension"
  validates_attachment_content_type :cv, content_type: ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "text/plain","text/csv","image/jpg", "image/jpeg", "image/png", "image/gif","application/xls"]

end
