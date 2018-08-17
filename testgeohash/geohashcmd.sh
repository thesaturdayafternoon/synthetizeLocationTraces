
#!/bin/sh

START=$(date +%s)

#firstoutfile="firstoutfile"
#infile="new_abcoij.txt"
#infile="new_abdremlu.txt"
#infile="new_abboip.txt"


matrix="matrix"


#Check if firstoutfile exists
#if [ -f $firstoutfile ];
#then
#echo "File $firstoutfile exists, so I remove it..."
#rm $firstoutfile
#else
#echo "File $firstoutfile does not exist"
#fi

#touch $firstoutfile


for c in $PWD/results/*; do   
   
	rm $c
	
done


N=0

echo "********************Executing awk to all traces and storing the results********************"

	
	for i in $PWD/traces/*.txt; do 
		
		N=$[N+1]
		
		echo "-creating matrix for file: $(basename $i)"
		
		name=$(basename $i)
		name="$PWD/results/matrix_$name"
		touch $name

		awk -v filename=$name -f geohash.awk $i 
	done

echo "number of examples=$N"

END=$(date +%s)
DIFF=$(( $END - $START ))
echo "It took $DIFF seconds"

