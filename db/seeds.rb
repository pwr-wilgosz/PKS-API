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

