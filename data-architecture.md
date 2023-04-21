### Airport

| field        | type   | validations        |
| ------------ | ------ | ------------------ |
| airport_code | string | presence, 3 chars  |
| airport_name | string | presence, 20 chars |

```ruby
has_many :departing_flights, foreign_key: :departure_airport_id, class_name: "Flight"
has_many :arriving_flights, foreign_key: :arrival_airport_id, class_name: "Flight"
```

### Flight

| field                | type      | validations |
| -------------------- | --------- | ----------- |
| departure_airport_id | reference | -           |
| arrival_airport_id   | reference | -           |
| date                 | date      | -           |
| time                 | time      | -           |
| duration             | int       | -           |

```ruby
belongs_to :departure_airport, class_name: "Airport"
belongs_to :arrival_airport, class_name: "Airport"
has_many :bookings
has_many :passengers, through: :bookings
```

### Passenger

| field      | type      | validations          |
| ---------- | --------- | -------------------- |
| name       | string    | presence, 2-50 chars |
| email      | string    | presence, email      |
| booking_id | reference | -                    |

```ruby
has_many :bookings
has_many :flights, through: :bookings

belongs_to :booking
```

### Booking

| field            | type      | validations |
| ---------------- | --------- | ----------- |
| flight_id        | reference | -           |

```ruby
has_many :passengers
belongs_to :flight
```

