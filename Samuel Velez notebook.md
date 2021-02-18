Samuel Velez: Laboratory notebook

02/17/2020
Statistics Canada was decided as the source of our API. Work distribution assigned me the development of a wrapper for Date Ranges, instead of full tables. Professor Lucet approved the project.

02/18/2020
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