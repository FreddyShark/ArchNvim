import time

count = 0
while True:
    count += 1
    time.sleep(1)
    if count >= 60*5 - 10:
        time.sleep(0.5)
        print("\a")
        time.sleep(0.5)
        print("\a")
        time.sleep(0.5)
        print("\a")
        count = 0



