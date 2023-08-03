import os

VAR1 = os.environ.get("VAR1")
VAR2 = os.environ.get("VAR2")
assert VAR1 is not None
assert VAR2 is not None
