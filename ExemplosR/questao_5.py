import random as Random

class DataStored:

    def __init__(self, probability : float, has_mantaining : bool | None = False):
        self.probability = probability
        self.has_mantaining = has_mantaining
        self.frequency = 0

    def __str__(self):
        mantanining_str : str = "There IS" if self.has_mantaining else "There IS NO"
        return f"{mantanining_str} mantaining, probability {self.probability}, happened {self.frequency} times"

data : dict = {
    "Cause1": DataStored(0.04, False),
    "Cause2": DataStored(0.04, False),
    "Cause3": DataStored(0.06, False),
    "Cause4": DataStored(0.06, False),
}

mantaining_risk_reduction : dict = {
    "Cause1": 1.0, # Same
    "Cause2": 1.0, # Same
    "Cause3": 0.5, # 50% less
    "Cause4": 0.5, # 50% less
}

amount_proper_mantaining : float = 0.4  

samples : int = 1_000_000

# III: Present a defect if there is not maintenance

# for _ in range(0, samples):
#     draw = Random.choices(
#         population = list( data.keys() ),
#         weights = [ data_stored.probability for data_stored in data.values() ],
#         k = 1
#     )

#     cause = draw[0]
#     data[cause].frequency += 1

# for key, data_stored in data.items():
#     print(f"{key}: {data_stored}")

# II: Present a defect if there is maintenance

# for cause, risk_multiplier in mantaining_risk_reduction.items():
#     data[cause].probability *= risk_multiplier

# for _ in range(0, samples):
#     draw = Random.choices(
#         population = list( data.keys() ),
#         weights = [ data_stored.probability for data_stored in data.values() ],
#         k = 1
#     )

#     cause = draw[0]
#     data[cause].frequency += 1

# for key, data_stored in data.items():
#     print(f"{key}: {data_stored}")

# I: Present a defect

# boolean_choices : dict = {
#     "Yes": 0.4,
#     "No": 0.6
# }

# for cause, risk_multiplier in mantaining_risk_reduction.items():
#     boolean_draw = Random.choices(
#         population = list( boolean_choices.keys() ),
#         weights = list( boolean_choices.values() ),
#         k = 1
#     )

#     if (boolean_draw[0] == "Yes"):
#         data[cause].has_mantaining = True
#         data[cause].probability *= risk_multiplier
#     else:
#         data[cause].has_mantaining = False

# for _ in range(0, samples):
#     draw = Random.choices(
#         population = list( data.keys() ),
#         weights = [ data_stored.probability for data_stored in data.values() ],
#         k = 1
#     )

#     cause = draw[0]
#     data[cause].frequency += 1

# for key, data_stored in data.items():
#     print(f"{key}: {data_stored}")