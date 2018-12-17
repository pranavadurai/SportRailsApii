class Profile < ApplicationRecord
  belongs_to :user

  has_attached_file :avatar, styles: { medium: ["300x300>",:png], thumb: ["100x100>",:png] }

  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
