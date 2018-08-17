BEGIN {

	gridSize=5.00

	minLat=37.20
        maxLat=37.99

	minLong=122.00
        maxLong=122.56

	latInterval=(maxLat-minLat)/(gridSize-1)
	printf("latitude interval= %.3f\n",latInterval)

	longInterval=(maxLong-minLong)/(gridSize-1)
	printf("longitude interval= %.3f\n",longInterval)
	
	tempLat=minLat
	tempLong=minLong
	for (i = 1; i <=gridSize; i++){

		gridLats[i]=tempLat
		tempLat=tempLat+latInterval

		gridLongs[i]=tempLong
		tempLong=tempLong+longInterval
	}

	for (i = 1; i <=gridSize; i++){

	printf("lat: %.3f\n",gridLats[i])

		
	}

	for (i = 1; i <=gridSize; i++){

	printf("long: %.3f\n",gridLongs[i])

		
	}

	for (i = 1; i <=gridSize; i++){
		for (j = 1; j <=gridSize; j++){
	
			grid[i,j]=0.0000;
		}	

	}

	
   	 
}


{
   	timeStamp= $4

	latitude=$1
	longitude=substr($2,2)
	

	cellLatFound=false
	cellLongFound=false
	for (i = 1; i <=gridSize; i++){
	
		if(latitude>= minLat && latitude<=maxLat && longitude>= minLong && longitude<= maxLong)

		{	if(latitude<gridLats[i] && cellLatFound==false){ 

				cellLatIndex=i-1
				cellLatFound=true

			}
			if(longitude<gridLongs[i]&& cellLongFound==false){
				
				cellLongIndex=i-1
				cellLongFound=true
			}
			
			
		}

		
	}
	
	grid[cellLatIndex,cellLongIndex]=timeStamp
		
  
}

END {

	    	for (i = 1; t <=NR; t++){

			#printf("%d\n",timeStamp[t])>> filename
			#printf("%.5f\n",latitude[t])>> filename
			#printf("%.5f\n",longitude[t])>> filename
	}

	




		for (i = 1; i <=gridSize; i++){
			for (j = 1; j <=gridSize; j++){
	
				
				printf("%.2f ",grid[i,j])>> filename
			}
			printf("\n")>> filename	

		}

   	
  
}

