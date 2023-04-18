# ChatGPT generated
airports = [
  { name: "John F. Kennedy International Airport", code: "JFK" },
  { name: "Heathrow Airport", code: "LHR" },
  { name: "Charles de Gaulle Airport", code: "CDG" },
  { name: "Los Angeles International Airport", code: "LAX" },
  { name: "Dubai International Airport", code: "DXB" },
  { name: "Beijing Capital International Airport", code: "PEK" },
  { name: "Frankfurt Airport", code: "FRA" },
  { name: "Narita International Airport", code: "NRT" },
  { name: "Sydney Airport", code: "SYD" },
  { name: "O'Hare International Airport", code: "ORD" },
  { name: "Hong Kong International Airport", code: "HKG" },
  { name: "Amsterdam Airport Schiphol", code: "AMS" },
  { name: "Singapore Changi Airport", code: "SIN" },
  { name: "Incheon International Airport", code: "ICN" },
  { name: "Istanbul Airport", code: "IST" },
  { name: "Denver International Airport", code: "DEN" },
  { name: "Suvarnabhumi Airport", code: "BKK" },
  { name: "Toronto Pearson International Airport", code: "YYZ" },
  { name: "Shanghai Pudong International Airport", code: "PVG" },
  { name: "Munich Airport", code: "MUC" },
]

airports.each do |airport|
  Airport.create(airport_name: airport[:name], airport_code: airport[:code])
end
