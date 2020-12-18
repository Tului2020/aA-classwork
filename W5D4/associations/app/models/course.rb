class Course < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :students,
        through: :enrollments,
        source: :user

    belongs_to :prereq,
        primary_key: :id,
        foreign_key: :prereq_id,
        optional: true,
        class_name: :Course

    belongs_to :instructor,
        primary_key: :id,
        foreign_key: :instructor_id,
        class_name: :User

end
