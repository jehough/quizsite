require './config/environment'

require_relative './app/controllers/teacher_controller'
require_relative './app/controllers/student_controller'

use StudentController
use TeacherController
run ApplicationController
