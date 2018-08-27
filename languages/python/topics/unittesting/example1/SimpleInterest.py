# Description: Compute simple interest

def computeSimpleInterest(principal, rateInPercent, timeInYears):
    """Computes and returns simple interest"""

    interest = 0

    if timeInYears < 0 or rateInPercent < 0:
        return interest

    interest = principal * rateInPercent * timeInYears / 100

    return interest


# Function Call
interest = computeSimpleInterest(100, 10, 2)
print interest
