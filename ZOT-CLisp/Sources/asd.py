def distance(a, b):
    return int(abs( (a % 13) - (b % 13)) + abs( (a % 7) - (b % 7) ))


for pos1 in range(1, 2):
    for pos2 in range(pos1, 7*13):
        print ("Dist", pos1, " - ", pos2, " = ", distance(pos1, pos2) )
