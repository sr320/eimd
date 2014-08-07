Input = open("./BD_FAT_chart.txt", 'r')
Output = open("./GOs_Ben.csv", 'w')
for line in Input:
    Test = line.strip().split('\t')
    More = Test[1].split('~')
    GO = More[0]
    out = GO + ',' + Test[11] + '\n'
    Output.write(out)
Output.close