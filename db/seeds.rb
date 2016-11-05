User.destroy_all
User.create [
  { email: 'driver@test.com', role: 'driver', password: 'password', password_confirmation: 'password' },
  { email: 'passenger@test.com', role: 'passenger', password: 'password', password_confirmation: 'password' },
  { email: 'mechanic@test.com', role: 'mechanic', password: 'password', password_confirmation: 'password' },
  { email: 'admin@test.com', role: 'admin', password: 'password', password_confirmation: 'password' }
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
  { name: 'Wheel broken', description: 'Sample description', bus: Bus.first, solved: false }
]

