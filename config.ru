require './config/environment'

require_relative './app/controllers/teacher_controller'
require_relative './app/controllers/student_controller'
require_relative './app/controllers/teacher_course_controller'
require_relative './app/controllers/teacher_quiz_controller'
require_relative './app/controllers/question_controller'
require_relative './app/controllers/teacher_course_quiz_controller.rb'
require_relative './app/controllers/student_course_controller'

use Rack::MethodOverride
use StudentCourseController
use TeacherCourseQuizController
use QuestionController
use TeacherQuizController
use TeacherCourseController
use StudentController
use TeacherController
run ApplicationController
