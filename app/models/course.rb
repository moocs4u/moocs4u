class Course < ActiveRecord::Base
  has_attached_file :course_image, :styles => { :medium => "262x136>" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :course_image, :content_type => /\Aimage\/.*\Z/
  validates :name, :description, presence: true
  validates :length, numericality: { only_integer: true, greater_than_or_equal_to: 1}
end
