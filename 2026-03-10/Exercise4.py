import random as Random

'''
Notes: the game was supposed to end when someone is eliminated.
The access to values is TRASH, I should just make a class to the type
'''

players : dict = {
    # Money | Probability
    "Maria": [150, 0.3],
    "Gustavo": [70, 0.4],
    "Jorge": [240, 0.3]
}

rounds : int = 1_000
# rounds : int = 10

player_2_remove = ""

for _ in range(0, rounds):

    # Each player pays 1 dollar each round
    for values in players.values():
        values[0] -= 1
        
    draw = Random.choices(
        population = list(players.keys()),
        weights = [values[1] for values in players.values()],
        k = 1
    )
    
    winner = draw[0]

    # The winner takes all
    players[winner][0] += len(players)
    # print(f"{winner} won this round - {players[winner][0]} dollars")

    # Checks if a player lost
    for player, values in players.items():
        if values[0] == 0:
            player_2_remove = player
            print(f"{player_2_remove} should be removed because he/she has {values[0]} dollars")

    # Removes the player
    if player_2_remove != "":
        players.pop(player_2_remove)
        print(f"{player_2_remove} got eliminated")

        if len(players) == 1:
            break
        player_2_remove = ""

print(players)