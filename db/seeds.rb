current_time = Time.now
User.destroy_all
User.create [
  { email: 'driver@test.com', role: 'driver', password: 'password', password_confirmation: 'password', confirmed_at: current_time },
  { email: 'passenger@test.com', role: 'passenger', password: 'password', password_confirmation: 'password', confirmed_at: current_time },
  { email: 'mechanic@test.com', role: 'mechanic', password: 'password', password_confirmation: 'password', confirmed_at: current_time },
  { email: 'admin@test.com', role: 'admin', password: 'password', password_confirmation: 'password', confirmed_at: current_time }
]

Bus.destroy_all
Bus.create [
  { brand: 'Mercedes', spaces: 45, registration_number: 'DW ABC1' },
  { brand: 'Porshe', spaces: 62, registration_number: 'DW ABC2' },
  { brand: 'Mercedes', spaces: 40, registration_number: 'DW ABC3' },
  { brand: 'Renault', spaces: 45, registration_number: 'DW ABC4' },
]

Issue.destroy_all
Issue.create [
  { name: 'Wheel broken', description: 'Sample description', bus: Bus.first, solved: false },
  { name: 'Air conditioning fail', description: 'Air conditioning is not working', bus: Bus.first, solved: true },
  { name: 'Porshe'' signpost', description: 'Signpost in this bus flashes too fast.', bus: Bus.find_by_registration_number('DW ABC2'), solved: false },
]

Stop.destroy_all
Stop.create [
  { name: 'Wroclaw' },
  { name: 'New York' },
  { name: 'London' },
  { name: 'Szczawno-Zdroj' },
]

Course.destroy_all
Course.create [
  { name: 'Pierwszy' },
  { name: 'Drugi'  }
]

CourseStop.destroy_all
CourseStop.create [
  { course: Course.first, stop: Stop.first },
  { course: Course.first, stop: Stop.second },
  { course: Course.first, stop: Stop.last },
  { course: Course.last, stop: Stop.first },
  { course: Course.last, stop: Stop.third },
  { course: Course.last, stop: Stop.last }
]

BusCourse.destroy_all
BusCourse.create [
  { bus: Bus.first, course: Course.first },
  { bus: Bus.second, course: Course.last }
]