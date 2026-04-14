import random

__all__ = ["ProbabilityCalculator"]

class ProbabilityCalculator:

    def __init__(self, options: list[str], weights: list[float] | None = None):

        if ( weights is not None ) and ( len(options) != len(weights) ):
            raise ValueError("Length of options and weights must match.")

        self.data = {}
        self.have_results_been_generated = False

        if weights is None:
            options_amount : int = len(options)
            weights : list[float] = [ 1 / options_amount ] * options_amount

        for option, weight in zip(options, weights):
            self.data[option] = {
                'count': 0,
                'weight': weight
            }

    def Generate(self, samples_amount : int) -> bool:
        if samples_amount == 0:
            return False

        options : list[str] = list(self.data.keys())
        weights : list[float] = [self.data[option]['weight'] for option in self.data.keys()]

        results = random.choices(
            population = options,
            weights = weights,
            k = samples_amount
        )

        for result in results:
            self.data[result]['count'] += 1

        self.have_results_been_generated = True

        return True


    def Print(self, should_show_real_precision : bool | None = False) -> bool:
        if not self.have_results_been_generated:
            print("No generation has been done yet. Use Generate() to do it.")
            return False

        samples_amount = sum(items['count'] for items in self.data.values())

        for option, items in self.data.items():
            weight : float = items['weight']
            count : int = items['count']

            if (should_show_real_precision):
                probability : float = count / samples_amount

            else:
                probability_precision : int = 2
                probability : float = round(count / samples_amount, probability_precision)

            print(f"{option} with {weight} weight happened {count} times, which indicates ~{probability} probability.")

        return True