import random as rnd
import string
import time

try:
  e = chr(27)
  screenlen = 30 # TODO: find out screen width
  screenwidth = 30 # TODO: find out screen width

  while True:
    chars: str = string.ascii_lowercase + string.ascii_uppercase + ",.:;\"'?/\\^&*()_+=!@#$%~|{}[]" + "1234567890"
    length: int = rnd.randint(10, 20)
    stream: str = f"{e}[32m" + ('\n'.join(rnd.choices(chars, k=length)))
    print(f"{e}[2J")
    print(stream)
    time.sleep(0.2)

except KeyBoardInterrupt:
  exit()

