import random

coin_options = {"Cara": 0, "Coroa": 0}
coin_chances = [ 1 / len(coin_options) ] * len(coin_options)

dice_options = {"1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0}
dice_chances = [ 1 / len(dice_options) ] * len(dice_options)

combined_options = {
f"{coin} & {dice}" : 0
for coin in coin_options
for dice in dice_options
}

samples_amount = 1_000_000

coin_results = random.choices(
population=list(coin_options.keys()),
weights=coin_chances,
k=samples_amount
)

dice_results = random.choices(
population=list(dice_options.keys()),
weights=dice_chances,
k=samples_amount
)

for coin_result, dice_result in zip(coin_results, dice_results):
coin_options[coin_result] += 1
dice_options[dice_result] += 1
combined_options[f"{coin_result} & {dice_result}"] += 1

print("Coin results:")
for key, value in coin_options.items():
print(f"{key}: {value}")

print("\nDice results:")
for key, value in dice_options.items():
print(f"{key}: {value}")

print("\nCombined results:")
for key, value in combined_options.items():
print(f"{key}: {value}")