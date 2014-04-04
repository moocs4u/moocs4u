require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  course = Course.new
  assert course.invalid?
  assert course.errors[:name].any?
  assert course.errors[:description].any?
  assert course.errors[:image_url].any?
  
end
