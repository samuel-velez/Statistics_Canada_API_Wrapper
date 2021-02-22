Samuel Velez: Laboratory notebook

17/02/2020
Statistics Canada was decided as the source of our API. Work distribution assigned me the development of a wrapper for Date Ranges, instead of full tables. Professor Lucet approved the project.

18/02/2020
Work started by reading Statistics Canada's documentation on how to use their web utilities, which specify the use of POST, along with the required parameters (a vector, a start date, and an end date). Upon attempts to use the GET function as I knew it (passing strings into it to adjust the URL), I understood why POST was recommended instead, and started looking into examples on how parameters are transferred into Statistics Canada (https://towardsdatascience.com/how-to-collect-data-from-statistics-canada-using-python-db8a81ce6475 and https://github.com/mountainMath/cancensus). With these two examples I started building towards coding the right way to parametrize my request.

Getting vectors right is necessary to get it working. To get a vector these are the steps:
1. Go to Statcan Data https://www150.statcan.gc.ca/n1//en/type/data?MM=1#tables
2. Look for your preferred dataset.
3. Click Add/Remove data.
4. Click on Customize layout.
5. Scroll down and tick the option Display Vector identifier and coordinate, then click the button Apply.
6. On the vector column, you can find the vectorID.

By reading through cancensus' documentation I arrived at a solution using my own code, but found out it stopped working randomly, while cancensus worked well consistently. The inclusion of a timeout parameter, encoding and headers fixed the issue.

Extra work making the results more readable and the code a bit simpler was also performed today.

20/02/2020
Investigating how to implement Travis CI con the project proves useless as after several attempts I find it is incompatible with R (as far as I could tell) and focus switched to Git Actions. Since the main wrapper is still in process this was postponed until we could standardize and merge both functions.

Work on merging the function started this day with Mandar and I pushing our work into the main branch. We met to review each other's code and unify our technique and results. I implemented his internet status and connection checker to failsafe the date range function.

21/02/2020
Implementation of Github Actions to CI our project through its R functions seems much easier than Travis, with real time tests instead of the queue. Had some trouble because of the very specific formatting they requiere on the description file and so on.

We finished merging our two functions to unify the main file of the project and merged with Vicens' branch. This concluded the main part of the work and I stayed to read and publish the work, while Vicens worked on finishing the example of application of our code.