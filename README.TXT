
HOW TO RUN:

	Simply run the script 'runAll.m', while having it in the same
	directory with the rest of the files (dependency on functions)

	To begin, enter the amount of cities you would like to travel to.
	Note that this does not include your initial city.

	Then, enter one by one the cities you would wish your trip to 
	begin. They do not have to be large cities, but large enough to 
	be listed in a database of ~7300 cities worldwide.

	If you agree with the program's suggestion enter 'y' or 'yes'
	else enter anything different. The program might give you
	additional options on the same city name, or will prompt you
	that the name was not found (note search is case insensitive)

	Finally, the program prints you the absolute (or approximate for 
	>=10 cities) fastest way of travelling to all the cities you have 
	selected and back, as well as the total distance in kms.

WHAT DOES EACH FILE DO:

	runAll.m:
		contains a script which runs the whole program.

	isFound.m:
		contains the isFound function that returns whether a city
		is found in the dataBase and its index.

	setGraph.m:
		contains a function that takes the latitudes and longitudes
		of the cities selected and creates a table-graph with the
		distance between every two.

	getDistance.m
		contains a simple function that finds the total distance
		of a given route. Used as helper by below heuristic funcs.

	bruteForce.m:
		cointains the function bruteForce, which goes through all 
		possible routes and determines the shortest.
	
	simulatedAnnealing:
		contains the function simulatedAnnealing, which uses a very 
		interesting method(explained in its comments) to approximate 
		the shortest route between the cities.

	shortestPath.m:
		contains the function shortestPath, which determines which
		of the two above heuristic functions should work, depending
		on input size;

	cityData.mat:
		contains the database of 7300 cities, their countries,
		longitudes and lattitudes.
		Source: http://simplemaps.com/data/world-cities

	testAll.m: 
		contains a script with 4 data sets of varying sizes, to test
		the efficiency and accuracy of each algorithm.

	README.TXT:
		contains information on 'how to run the program', 'what each
		file does', 'suggestions on how to run an example', 'testing', and
        'limitations'.
	

HOW TO RUN AN EXAMPLE:

	Testing inputs (Run runAll file):

	START INPUT
		4
		boston
		y

		Los angeles
		no
		Y

		awpdokaspod
		hOnoLuLu
		yes

		beijing
		yes

		paris
		NOPE

		Athens
		y
	FINISH INPUT (circle around the Earth completed :)

    START EXPECTED OUTPUT
        Boston - Athens - Beijing - Honolulu - Los Angeles - Boston
        Distance: 31686 km
    END EXPECTED OUTPUT

	the same can be applied for long series of cities 
	(where the simulated annealing method takes places)
	Instead of going through that though, you can instead 
	use the test file, testing each of 4 input sizes (9, 10, 15, 42)

	size 9 works fine on bruteForce 
	(and 10 works in ~15s with a decent processor)

	every size works fine on simulatedAnnealing, but as we 
	increase the size, it starts having an error margin 
	(as you can see by repetedly calling it)

TESTING:

	each function was unit tested and checked that it works correctly for
	edge cases. Also, using the testAll.m script, I varied variables (such
	as T, minT, L in the simulated Annealing function), to come to a result
	where we get a good result without much time expense.

LIMITATIONS:

	the equations I use to calculate distance between points on the surface
	of the Earth are not completely accurate, as they assume Earth to be a
	sphere. Also, the algorithms do not take into account difficulty of
	crossing natural boundaries, so they only mostly apply to the case of 
	direct movement (e.g. flight, train) between the cities mentioned.