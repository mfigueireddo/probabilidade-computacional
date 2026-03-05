import random as Random
import math as Math

points : dict[str, list[float,float]] = {
    "A": [0.0, 0.0],
    # "B": [1.0, 0.0],
    "C": [1.0, 1.0]
    # "D": [0.0, 1.0]
}

def CalculateDistance(pointA : list[float, float], pointB : list[float, float]) -> float:
    A_x, A_y = pointA
    B_x, B_y = pointB

    return Math.sqrt((B_x - A_x)**2 + (B_y - A_y)**2)

samples : int = 1_000_000
green_zone_area : int = 0

for _ in range(samples):
    # Random.random() distribui de maneira uniforme
    x : float = Random.random()
    y : float = Random.random()

    inbounds : bool = True

    for reference in points.values():
        distance : float = CalculateDistance(reference, [x, y])
        if distance > 1.0:
            inbounds = False

    if inbounds:
        green_zone_area += 1

side_length : int = 1 # km
fertilizers_per_km2 : int = 200 # kg
months : int = 12

total_fertilizers_needed : int = green_zone_area * fertilizers_per_km2 * months
print(f"{total_fertilizers_needed} fertilizers will be needed for a total area of {green_zone_area}km of land.")