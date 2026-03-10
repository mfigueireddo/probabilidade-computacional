import random

# Cálculo das probabilidades em cada caso

cases = {"A": 0, "B": 0}

def contabilize_results(cases, results):

    first, second, third = results[:3]

    if (first == "Cara"):
        cases["A"] += 1

# Opções e chances

coin_options = {"Cara": 0, "Coroa": 0}
coin_chances = [3/5, 2/5]

# Sorteio

samples_amount = 1_000_000

coin_results = random.choices(
    population=list(coin_options.keys()),
    weights=coin_chances,
    k=samples_amount
)

# Parseando pelos resultados

index = 0
result_tracker = ["", "", ""]

for coin_result in coin_results:

    result_tracker[index] = coin_result

    # TODO: muito feio isso
    index += 1
    if (index == 3):
        contabilize_results(cases, result_tracker)
        result_tracker = ["", "", ""]
        index = 0

    # Exibição dos resultados

for key, value in cases.items():
    print(f"{key}: {value}")