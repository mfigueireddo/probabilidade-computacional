from ProbabilityCalculatorClass import ProbabilityCalculator

samples_amount : int = 1_000_000

# --- --- --- --- --- ---

coin_calculator = ProbabilityCalculator(
    ["Cara", "Coroa"],
    [float(1/2), float(1/2)]
)

coin_calculator.Generate(samples_amount)
coin_calculator.Print()

# --- --- --- --- --- ---

dice_calculator = ProbabilityCalculator(
    [str(index) for index in range(1, 7)]
)

dice_calculator.Generate(samples_amount)
dice_calculator.Print()