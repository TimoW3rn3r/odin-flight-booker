# ChatGPT generated
airports = [
  { name: 'John F. Kennedy International Airport', code: 'JFK' },
  { name: 'Heathrow Airport', code: 'LHR' },
  { name: 'Charles de Gaulle Airport', code: 'CDG' },
  { name: 'Los Angeles International Airport', code: 'LAX' },
  { name: 'Dubai International Airport', code: 'DXB' },
  { name: 'Beijing Capital International Airport', code: 'PEK' },
  { name: 'Frankfurt Airport', code: 'FRA' },
  { name: 'Narita International Airport', code: 'NRT' },
  { name: 'Sydney Airport', code: 'SYD' },
  { name: "O'Hare International Airport", code: 'ORD' },
  { name: 'Hong Kong International Airport', code: 'HKG' },
  { name: 'Amsterdam Airport Schiphol', code: 'AMS' },
  { name: 'Singapore Changi Airport', code: 'SIN' },
  { name: 'Incheon International Airport', code: 'ICN' },
  { name: 'Istanbul Airport', code: 'IST' },
  { name: 'Denver International Airport', code: 'DEN' },
  { name: 'Suvarnabhumi Airport', code: 'BKK' },
  { name: 'Toronto Pearson International Airport', code: 'YYZ' },
  { name: 'Shanghai Pudong International Airport', code: 'PVG' },
  { name: 'Munich Airport', code: 'MUC' }
]

# Delete old records
Airport.delete_all
Flight.delete_all

# Add new entries to airports
airports.each do |airport|
  Airport.create(airport_name: airport[:name], airport_code: airport[:code])
end

# Add new entries to flights
ids = Airport.ids

100.times do
  departure_airport_id = ids.sample
  arrival_airport_id = ids.sample

  date = Date.today + rand(0..10).days
  t = Time.now + rand(0..24*60).minutes
  time = t - (t.min % 30).minutes - t.sec

  duration = rand(10..1000)

  Flight.create(
    arrival_airport_id:,
    departure_airport_id:,
    date:,
    time:,
    duration:
  )
end
