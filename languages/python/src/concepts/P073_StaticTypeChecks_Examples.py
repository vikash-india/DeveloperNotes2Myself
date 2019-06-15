# Description: Static Type Checks

# Note
# 1. Run the type checker mypy typing_test.py

from typing import List
from typing import Dict
from typing import Tuple

# Static Type for Variables
# Syntax: variable: type = value
my_string: str = "My String Value"


# Static Type for Functions
# Syntax: def function_name(parameter1: type) -> return_type:
def sum(value1: int, value2: int) -> int:
    return value1 + value2


# Static Type for List
# Syntax: list_name: List[type] = [ ... ]
numbers: List[int] = [1, 2, 3, 4, 5, 6]

# Static Type for Dictionary
# Syntax: dictionary_name: Dict[type, type, ...] = { ... }
# A dictionary where the keys are strings and the values are ints
name_counts: Dict[str, int] = {
    "Dilbert": 30,
    "Catbert": 40
}

# Static Type for a List of Dictionary with String Key and Int Value
# Syntax: list_of_dicts: List[Dict[type, type]] = [ ... ]
list_of_dicts: List[Dict[str, int]] = [
    {"key1": 1},
    {"key2": 2}
]

# Static Type for a Tuple
# Syntax: tuple_name: Tuple[type, type, ...] = ( value, value, ... )
tuple_data: Tuple[str, int, float] = ("Dilbert", 23, 23.7)

# Create aliases for complex types just by assigning them to a new name:
LatitudeLongitutdeVector = List[Tuple[float, float]]
coordinates: LatitudeLongitutdeVector = [
    (25.91375, -60.15503),
    (-11.01983, -166.48477),
    (-11.01983, -166.48477)
]
