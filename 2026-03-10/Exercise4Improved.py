import random as Random

'''
Notes: the game was supposed to end when someone is eliminated.
The access to values is TRASH, I should just make a class to the type
'''

class DataStored:
    money : float
    probability : float

    def __init__(self, money : float, probability : float):
        self.money = money
        self.probability = probability

    def __str__(self):
        return f"Money: {self.money} Probability: {self.probability}"

data : dict = {
    "Maria": DataStored(150, 0.3),
    "Gustavo": DataStored(70, 0.4),
    "Jorge": DataStored(240, 0.3)
}

rounds : int = 1_000

player_to_remove : str= ""

for _ in range(0, rounds):

    # Each player pays 1 dollar each round
    for data_stored in data.values():
        data_stored.money -= 1
        
    draw = Random.choices(
        population = list(data.keys()),
        weights = [data.probability for data in data.values()],
        k = 1
    )
    
    winner = draw[0]

    # The winner takes all
    data[winner].money += len(data)
    # print(f"{winner} won this round - {data[winner].money} dollars")

    # Checks if a player lost
    for player, data_stored in data.items():
        if data_stored.money == 0:
            player_to_remove = player

    # Removes the player
    if player_to_remove != "":
        data.pop(player_to_remove)
        print(f"{player_to_remove} got eliminated")

        if len(data) == 1:
            break
        player_to_remove = ""

for player, data_stored in data.items():
    print(f"{player} - {data_stored}")