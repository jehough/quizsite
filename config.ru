require './config/environment'

require_relative './app/controllers/teacher_controller'
require_relative './app/controllers/student_controller'
require_relative './app/controllers/teacher_course_controller'
require_relative './app/controllers/teacher_quiz_controller'
require_relative './app/controllers/question_controller'

use QuestionController
use TeacherQuizController
use TeacherCourseController
use StudentController
use TeacherController
run ApplicationController
