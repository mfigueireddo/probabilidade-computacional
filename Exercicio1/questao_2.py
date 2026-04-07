import random as Random

class DataStored:

    def __init__(self, lifespan_reduction : float, probability : float, cost : float):
        self.lifespan_reduction = lifespan_reduction
        self.probability = probability
        self.cost = cost

    def __str__(self):
        return f"Lifespan reduction {self.lifespan_reduction} | Probability of {self.probability}% | Cost of R${self.cost}"

mistakes : dict = {
    "Mild" : DataStored(0.01, 0.7, 400),
    "Moderate" : DataStored(0.03, 0.2, 500),
    "Severe" : DataStored(0.07, 0.1, 700)
}

total_failure : dict  = {
    "Yes" : 0.002,
    "No" : 1.0 - 0.002
}

# for key, data_stored in mistakes.items():
#     print(f"{key}: {data_stored}")

Random.seed(123)

samples : int = 1_000
hours_per_round : int = 720

total_failure_cost : float = 2_000.0

lifespan_substitutions : int = 0
total_failure_substitutions : int = 0
cost : float = 0

for _ in range(0, samples):

    lifespan : float = 1.0

    for _ in range(0, hours_per_round):        

        # Total failure
        extreme_draw = Random.choices(
            population = list(total_failure.keys()),
            weights = [failure_chance for failure_chance in total_failure.values()],
            k = 1
        )

        if extreme_draw[0] == "Yes":
            # print("A total failure happened to the machine.")
            lifespan = 1.0
            total_failure_substitutions += 1
            cost += total_failure_cost
            # print("Equipment replaced")
            continue # The hourly checkup has been made

        # Expeceted failured
        normal_draw = Random.choices(
            population = list(mistakes.keys()),
            weights = [data_stored.probability for data_stored in mistakes.values()],
            k = 1
        )

        # print(normal_draw[0])
        lifespan -= mistakes[normal_draw[0]].lifespan_reduction

        if lifespan <= 0.0:
            # print("The equipment needs to be replaced")
            lifespan_substitutions += 1
            lifespan = 1.0
            cost += mistakes[normal_draw[0]].cost
            # print("Equipment replaced")

print(f"The equipment had to be replaced on average {(lifespan_substitutions+total_failure_substitutions)/samples} due to lifespan and total failures situations")
print(f"Total average cost of R${cost/samples}")
print(f"There has been an average of {total_failure_substitutions/samples} total failures")
print(f"In total, {samples} simulations were done with {hours_per_round} hours each, totalizng {samples*hours_per_round} loop iterations.")