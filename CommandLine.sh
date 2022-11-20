#!/bin/sh
>>places.tsv

#Number of places in (in order) Italy, Spain, France, England and US
grep -i "Italy" places2.tsv | wc -l
grep -i "Spain" places2.tsv | wc -l
grep -i "France" places2.tsv | wc -l
grep -i "England" places2.tsv | wc -l
grep -i "United States" places2.tsv | wc -l

#Subsets (one for each coutry) of the original dataset made of three columns: the first one has the number of people who visited aeach place of a certain country,
#the second one has the number of people who want to viasit a country and the third one has all addresses of that country. 
#We can use them to obtain the average number of people ho visited each country and the total number of people who want to visit each country.
cut -f7,8,14 places2.tsv | grep "Italy" > outputItaly.tsv
cut -f7,8,14 places2.tsv | grep "Spain" > outputSpain.tsv
cut -f7,8,14 places2.tsv | grep "France" > outputFrance.tsv
cut -f7,8,14 places2.tsv | grep "England" > outputEngland.tsv
cut -f7,8,14 places2.tsv | grep "United States" > outputUS.tsv

#People who visited, on average, (in order) Italy, Spain, France, England and US
awk '{s+=$1} END {print s/NR}' outputItaly.tsv
awk '{s+=$1} END {print s/NR}' outputSpain.tsv
awk '{s+=$1} END {print s/NR}' outputFrance.tsv
awk '{s+=$1} END {print s/NR}' outputEngland.tsv
awk '{s+=$1} END {print s/NR}' outputUS.tsv

#People who want to visit (in order) Italy, Spain, France, England and US 
awk '{s+=$2} END {print s}' outputItaly.tsv
awk '{s+=$2} END {print s}' outputSpain.tsv
awk '{s+=$2} END {print s}' outputFrance.tsv
awk '{s+=$2} END {print s}' outputEngland.tsv
awk '{s+=$2} END {print s}' outputUS.tsv
chmod +x CommandLine.sh
