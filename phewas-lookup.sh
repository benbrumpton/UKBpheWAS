# Create the regions file to query
##### Edit this####
echo "1	11063" > regions.txt
prefix=1.11063
### Stop ####

# Add header
zcat phecode-426.31-both_sexes.tsv.bgz | head -n1 > header1.1.txt
echo "phecode" > header1.2.txt
paste header1.1.txt header1.2.txt > UKBpheWAS.${prefix}.results.txt

# Query the results
#tabiix phecode-426.31-both_sexes.tsv.bgz -R regions.txt

# Loop through the results and append all to text file

for i in ls *-both_sexes.tsv.bgz
do
#tabix phecode-426.31-both_sexes.tsv.bgz -R regions.txt >> UKBpheWAS.${prefix}.results.txt 
	tabix ${i} -R regions.txt > tmp1.txt
	echo $i |cut -f2 -d"-" > tmp2.txt
	paste tmp1.txt tmp2.txt >> UKBpheWAS.${prefix}.results.txt
done
