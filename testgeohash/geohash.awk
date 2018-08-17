BEGIN {

	gridSize=28.00

	minLat=37.20
        maxLat=37.99

	minLong=122.00
        maxLong=122.56

	latInterval=(maxLat-minLat)/(gridSize-1)
	#printf("latitude interval= %.3f\n",latInterval)

	longInterval=(maxLong-minLong)/(gridSize-1)
	#printf("longitude interval= %.3f\n",longInterval)
	
	tempLat=minLat
	tempLong=minLong
	for (i = 1; i <=gridSize; i++){

		gridLats[i]=tempLat
		tempLat=tempLat+latInterval

		gridLongs[i]=tempLong
		tempLong=tempLong+longInterval
	}



	#for (i = 1; i <=gridSize; i++){

	#printf("lat: %.3f\n",gridLats[i])

		
	#}


	#for (i = 1; i <=gridSize; i++){

	#printf("long: %.3f\n",gridLongs[i])

		
	#}




	for (i = 1; i <=gridSize; i++){
		for (j = 1; j <=gridSize; j++){
	
			grid[i,j]=0.0000;
		}
			

	}
	#printf("1\n")
	
   	 
}


{
   	timeStamp= $4

	latitude=$1
	longitude=substr($2,2)
	

	cellLatFound=0
	cellLongFound=0

	#printf("2\n")
	for (i = 1; i <=gridSize; i++){

		#printf("3\n")
	
		if(latitude>= minLat && latitude<=maxLat && longitude>= minLong && longitude<= maxLong)

		{	
				#printf("4\n")

				if(latitude<gridLats[i] && cellLatFound==0){ 
				
				#printf("5\n")

				cellLatIndex=i-1
				cellLatFound=1

				}
			#printf("6\n")
			if(longitude<gridLongs[i]&& cellLongFound==0){
				
				cellLongIndex=i-1
				cellLongFound=1
			}
			#printf("7\n")
			
		}

		
	}
	#printf("8\n")
	grid[cellLatIndex,cellLongIndex]=timeStamp
		
  
}

END {

		#printf("9\n")
	    	for (t = 1; t <=NR; t++){

			#printf("%d\n",timeStamp[t])>> filename
			#printf("%.5f\n",latitude[t])>> filename
			#printf("%.5f\n",longitude[t])>> filename
	}

	



		#printf("10\n")
		for (i = 1; i <=gridSize; i++){
			for (j = 1; j <=gridSize; j++){
	
				
				printf("%d ",grid[i,j])>> filename
			}
			printf("\n")>> filename	

		}

   		#printf("11\n")
  
}

