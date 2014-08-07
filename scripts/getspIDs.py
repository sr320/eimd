from itertools import islice
n=19 #this is specific to how many rows of significant values you have (check your EXCEL file and remember to include the header)
Input = open("./DAVIDout.txt", 'r') #open your DAVID output
Output = open("./GOs_spIDs.csv", 'w') #name your outfile
lines_gen = islice(Input, n) #slice your DAVID output to just your sig terms + header
next(lines_gen) #skip your header
for line in lines_gen: #now start looping through
    Test = line.strip().split('\t') #strip white space off each line, split on the tab into a list called Test
    print Test[1] #check step, make sure you only get n-1
    More = Test[1].split('~') #get just your go term descriptor
    GO = More[1]
    preTerms = Test[5].split(',') #split out all your spIDs on the coma
    for term in preTerms: #loop through the preTerms spID list
        out = GO + ',' + term + '\n' #print a new line in your CSV for each spID, with the corresponding GO term
        Output.write(out)
Output.close
 
###YAY!  Note: if you have just your significant values, then you can cut out the n step and the islice step!###