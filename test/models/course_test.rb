require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "course attributes must not be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:name].any?
    assert course.errors[:description].any?
    assert course.errors[:image_url].any?
  end
  
  test "course length must be positive integer" do
    course = Course.new(name:    "My Cousre Name",
                        description: "yyy",
                        image_url: "zzz.jpg")
    course.length = -2
    assert course.invalid?
    assert_equal ["must be greater than or equal to 1"],
      course.errors[:length]

    course.length = 2.49
    assert course.invalid?
    assert_equal ["must be an integer"],
      course.errors[:length]

    course.length = 3
    assert course.valid?
  end

  def new_course(image_url)
    Course.new(name:        "My Course Name",
               description: "yyy",
               length:      4,
               image_url: image_url)
  end

  test "image_url" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_course(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_course(name).invalid?, "#{name} shouldn't be valid"
    end
  end


end
