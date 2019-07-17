require './config/environment'

require_relative './app/controllers/teacher_controller'

use TeacherController
run ApplicationController
