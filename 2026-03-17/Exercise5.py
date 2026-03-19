import random as Random

'''
TIP:
A easy way to do it is using "conjuntos" with tuples - they can't be modified which can simulate space!
'''

def DrawBoard(pacman : list[float], ghosts : list[list[float]], tablets : list[list[float]], map_size : int):
    print("=== BOARD DRAW ===")

    for row in range(1, map_size+1):
        for column in range(1, map_size+1):
            position = [row, column]

            if position in ghosts:
                print("G ", end="")
            elif position == pacman:
                print("P ", end="")
            elif position in tablets:
                print("T ", end="")
            else:
                print("_ ", end="")

        print("")

    print("")

def IsMoveValid(current_position : list[float], move : str, map_size : int) -> list[float] | None:
    next_position : list[float] = current_position.copy()
    if move == "Up":
        next_position[0] += -1
        next_position[1] += 0
    elif move == "Down":
        next_position[0] += 1
        next_position[1] += 0
    elif move == "Left":
        next_position[0] += 0
        next_position[1] += -1
    elif move == "Right":
        next_position[0] += 0
        next_position[1] += 1

    # print(f"The move would be to {next_position}")
    if next_position[0] < 1 or next_position[0] > map_size:
        return None
    elif next_position[1] < 1 or next_position[1] > map_size:
        return None
    
    return next_position

def GetRandomMove(moves : list[str]) -> list[float]:
    return Random.choices(
        population = moves,
        weights = [1.0 / len(moves)] * len(moves),
        k = 1
    )[0]

Random.seed(123)

# Unchangeable
samples : int = 1_000
map_size : int = 11
tablets_amount : int = 4
ghosts_amount : int = 3
pacman_wins : int = 0

for _ in range(samples):
    tablets_positions : list[list[float]] = []
    occupied_tablets_positions : list[int] = []

    # Generate tablets positions
    for _ in range(tablets_amount):
        while True:
            coordinates = Random.choices(
                population = range(1, map_size+1),
                weights = [1.0 / map_size] * map_size,
                k = 2
            )

            position = coordinates[:2]
            # print(f"Tablet at [{position[0]}, {position[1]}]")
            
            if position not in occupied_tablets_positions:
                tablets_positions.append(position)
                occupied_tablets_positions.append(position)
                break

            # print(f"Position {position} already occupied by another tablet")

    # print("=== TABLETS POSITIONS ===")
    # for id, position in tablets.items():
    #     print(f"{id}: {position}")

    ghosts_positions : list[list[float]] = [[1, 11], [11, 1], [11, 11]]

    # for ghost_position in ghosts_positions:
    #     print(f"Ghost at {ghost_position}")

    pacman_position : list[float] = [1, 1]

    characters_moves : list[str] = ["Up", "Down", "Left", "Right"]

    game_running : bool = True
    did_pacman_win : bool = True
    tablets_eaten : int = 0

    # A tablet can spawn at pacman's position
    if pacman_position in tablets_positions:
        # print("Lucky guy, Pacman spawned at the same spot as a table!")
        tablets_positions.remove(pacman_position)
        tablets_eaten += 1
        # print(f"{tablets_eaten} tablets eaten... {len(tablets_positions)} left")

    # First state of the board
    # DrawBoard(pacman_position, ghosts_positions, tablets_positions, map_size)

    while game_running:
        # Get a valid move for pacman
        while True:
            pacman_move = GetRandomMove(characters_moves)
            next_position = IsMoveValid(pacman_position, pacman_move, map_size)
            # print(f"Pacman wants to move {pacman_move} to {next_position}")
            if next_position is not None:
                # print("Legal move!")
                break
            # print("Illegal move.")

        pacman_position = next_position
        # DrawBoard(pacman_position, ghosts_positions, tablets_positions, map_size)

        # Did pacman eat a tablet?
        if pacman_position in tablets_positions:
            # print("Pacman ate a tablet!")
            tablets_positions.remove(pacman_position)
            tablets_eaten += 1
            # print(f"{tablets_eaten} tablets eaten... {len(tablets_positions)} left")
        
        # Check if pacman wins
        if tablets_eaten == tablets_amount:
            did_pacman_win = True
            game_running = False
            break

        for ghost_index, ghost_position in enumerate(ghosts_positions):
            # Get a valid move for the ghost
            while True:
                ghost_move = GetRandomMove(characters_moves)
                next_position = IsMoveValid(ghost_position, ghost_move, map_size)
                # print(f"A ghost wants to move {ghost_position} to {next_position}")
                if next_position is not None:
                    # print("Legal move!")
                    break
                # print("Illegal move.")

            ghosts_positions[ghost_index] = next_position
            # DrawBoard(pacman_position, ghosts_positions, tablets_positions, map_size)

            # Did the ghost caught pacman?
            if ghosts_positions[ghost_index] == pacman_position:
                did_pacman_win = False
                game_running = False
                break

    if did_pacman_win:
        pacman_wins += 1
        # print("Pacman won!!!")
    # else:
        # print("The ghosts won...")

    # print(f"{tablets_eaten}/{tablets_amount} tablets eaten")

print(f"Pacman won {pacman_wins}/{samples} times, which represents {pacman_wins/samples}% of the games")