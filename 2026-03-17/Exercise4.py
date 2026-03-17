import random as Random

Random.seed(123)

planes_capacity : int = 180
tickets_per_flight : int = 190

min_chance_boarding : float = 0.9
max_chance_boarding : float = 0.95

# Of the exceeding part
exceeding_pricing : dict = {
    0.25 : 1_000,
    0.75 : 2_500
}

volunteers : int = 0
forced_out : int = 0

samples : int = 100
flights_per_day : int = 20

exceeding_passengers : int = 0
passengers_at_flight : int = 0
passengers_absent : int = 0

cost_of_overbooking : float = 0

overbooking_counter : int = 0

for _ in range(samples):

    for plane_index in range(flights_per_day):

        # print(f"=== PLANE {plane_index} ===")

        # Boarding the passengers from last flight
        if exceeding_passengers > 0:
            # print(f"{exceeding_passengers} passengers remaining from the last flight have boarded")
            passengers_at_flight += exceeding_passengers
            exceeding_passengers = 0

        # Chooses from 0.9 to 0.95
        passenger_chance_to_board = Random.uniform(min_chance_boarding, max_chance_boarding)

        passengers_presence = Random.choices(
            population = [True, False],
            weights = [passenger_chance_to_board, 1.0 - passenger_chance_to_board],
            k = tickets_per_flight
        )

        for passenger_presence in passengers_presence:
            if passenger_presence == True:
                if passengers_at_flight + 1 > planes_capacity:
                    exceeding_passengers += 1
                    passenger_cost = Random.choices(
                        population = list(exceeding_pricing.values()),
                        weights = [chance for chance in exceeding_pricing.keys()],
                        k = 1
                    )[0]

                    # print(f"This passenger will accept R${passenger_cost} to board the next flight")
                    cost_of_overbooking += passenger_cost
                    
                    if passenger_cost == 1_000:
                        volunteers += 1
                    else:
                        forced_out += 1
                else:
                    passengers_at_flight += 1
            else:
                passengers_absent += 1

        if (exceeding_passengers > 0):
            overbooking_counter += 1

        # print(f"{passengers_at_flight} boarded")
        # print(f"{passengers_absent} didn't arrive to boarding")
        # print(f"{exceeding_passengers} exceeded and there so will wait for the next flight\n")

        passengers_at_flight : int = 0
        passengers_absent : int = 0

print(f"Overbooking costed R${cost_of_overbooking}, an average of {cost_of_overbooking/samples} per day")
print(f"It happened, on average, {overbooking_counter/samples} times per day")
print(f"On average, {volunteers/samples} passengers left the plane on their own and {forced_out/samples} had to be forced out")