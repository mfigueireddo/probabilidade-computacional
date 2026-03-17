import random as Random

class AgainstFighter:

    def __init__(self, fighter : str, probability : float):
        self.fighter = fighter
        self.probability = probability
    
    def __str__(self):
        return f"{self.probability} chance against {self.fighter}"
    
class FighterData:

    def __init__ (self, fighter1 : AgainstFighter, fighter2 : AgainstFighter):
        self.fighter1 = fighter1
        self.fighter2 = fighter2

    def __str__(self):
        return f"{self.fighter1}\n{self.fighter2}"
    
    def GetAgainstFighter(self, fighter : str) -> AgainstFighter:
        if self.fighter1.fighter == fighter:
            return self.fighter1
        elif self.fighter2.fighter == fighter:
            return self.fighter2
    
fighters_fight : dict = {
    "A" : FighterData(AgainstFighter("B", 0.6), AgainstFighter("C", 0.45)),
    "B" : FighterData(AgainstFighter("A", 0.4), AgainstFighter("C", 0.65)),
    "C" : FighterData(AgainstFighter("A", 0.55), AgainstFighter("B", 0.35)),
}

# for fighter, opponents in fighters_fight.items():
#     print(f"-- {fighter} --")
#     print(f"{opponents}")

fighters_rest : dict = {
    "A" : 0.4,
    "B" : 0.3,
    "C" : 0.3
}

# for fighter, chance in fighters_rest.items():
#     print(f"{fighter} has {chance} chance of resting in the first round")

Random.seed(123)

samples : int = 1_000
# samples : int = 1

fighters_wins : dict = {
    "A" : 0,
    "B" : 0,
    "C" : 0
}

# for fighter, wins in fighters_wins.items():
#     print(f"{fighter} has {wins} wins")

available_fighters : list[str] = ["A", "B", "C"]

for _ in range(0, samples):

    fighter_resting_name = Random.choices(
        population = available_fighters,
        weights = [chance for chance in fighters_rest.values()],
        k = 1
    )[0]

    # print(f"{fighter_resting_name} will rest in the first round")
    figther_resting = fighters_fight[fighter_resting_name]

    available_fighters.remove(fighter_resting_name)
    # print(f"The fighters available to fight in the first round are {available_figthers}")

    fighterA_name, fighterB_name = available_fighters[:2]
    figtherA = fighters_fight[fighterA_name]
    figtherB = fighters_fight[fighterB_name]
    fighterA_chance = figtherA.GetAgainstFighter(fighterB_name).probability
    fighterB_chance = figtherB.GetAgainstFighter(fighterA_name).probability

    # print(f"First fight: {fighterA_name} {fighterA_chance} x {fighterB_name} {fighterB_chance}")

    first_winner_name = Random.choices(
        population = [fighterA_name, fighterB_name],
        weights = [fighterA_chance, fighterB_chance],
        k = 1
    )[0]

    # print(f"And the winner is... {first_winner_name}!")

    fighterA_name = first_winner_name
    fighterB_name = fighter_resting_name
    figtherA = fighters_fight[fighterA_name]
    figtherB = fighters_fight[fighterB_name]
    fighterA_chance = figtherA.GetAgainstFighter(fighterB_name).probability
    fighterB_chance = figtherB.GetAgainstFighter(fighterA_name).probability

    # print(f"Second fight: {fighterA_name} {fighterA_chance} x {fighterB_name} {fighterB_chance}")

    second_winner_name = Random.choices(
        population = [fighterA_name, fighterB_name],
        weights = [fighterA_chance, fighterB_chance],
        k = 1
    )[0]

    # print(f"And the champion is... {second_winner_name}!")
    fighters_wins[second_winner_name] += 1

    available_fighters : list[str] = ["A", "B", "C"]

for fighter, wins in fighters_wins.items():
    print(f"{fighter} has an average of {wins/samples} wins ({wins} total)")