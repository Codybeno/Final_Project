  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Cody Benoy

  ## Summary of Findings
  |     |Min|Nomial|Max|
  |---|---|---|---|
  |Veloctiy|2|3.55|7.5|
  |FPA|-0.5|-0.18|0.4|

  In this study we were able to simulate the flight trajectory for velocity and flight path angle with varying conditions. We were also able to simulate 100 random trajectories with randwom values. We then plotted all of those with an average by polynomial fitting. We finished off with taking the derivative of the average. <br>
  We can see in he first figure when simulating 
  Reference the figures below as needed.
 
  # Code Listing
[PaperPlane.m](PaperPlane.m): <br>
A script that graphs all the different scenarios asked for in the problem. <br>
[EqMotion.m](EqMotion.m): <br>
A function given that has the equation of motions for the problem. <br>
[simVariations.m](simVariations.m): <br>
A function that shows the results for a varying single parameter. <br>
[randomTraj.m](randomTraj.m): <br>
A function that shows the results when generating random parameters for a 100 iterations along with the average. <br>
[derivatives.m](derivatives.m): <br>
A function that shows the derivative of the average trajectory. <br>
  # Figures

  ## Fig. 1: Single Parameter Variation
  ![Screenshot 2024-04-29 115444](https://github.com/Codybeno/Final_Project/assets/167140425/d5693c9a-532f-4501-9f3e-d6bee93b7c6c)

A graph showing the results when varying a single parameter.

  ## Fig. 2: Monte Carlo Simulation
 ![Screenshot 2024-04-30 153051](https://github.com/Codybeno/Final_Project/assets/167140425/476b1c98-6d40-446f-a226-ebb98288f20a)


A graph showing 100 ierations with random perameters for each iteration along with a bolded average.

 ## Fig. 3: Time Derivatives
 ![Screenshot 2024-04-29 155911](https://github.com/Codybeno/Final_Project/assets/167140425/61e4de83-1353-4512-899d-2960203f7672)

A graph showing the derivative of the averages of the range and height with respect to time.
