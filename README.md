# Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Nicholas Lawrynk

  ## Summary of Findings
                                      low	  high	nominal
    Initial Velocity (m/s):	           2	   7.5	  3.55
    Initial Flight Path Angle (rad): -0.5	   0.4	 -0.18

  This study accomplished in showing how variations in initial velocity and initial flight path angle change how high and how far
  a paper plane can fly.  This study also accomplished finding the average trajectory of the paper plane and finding the first-time derivatives
  of height and range of this average trajectory.

  I found that a higher initial velocity results in a higher flight and longer range of the paper plane, and that a lower initial velocity 
  results in a shallower flight with a shorter range.  I also found out that a higher initial flight path angle results in a very similar 
  flight and range of the nominal initial flight path angle, and that a lower initial flight path angle results in a shallower flight and a
  shorter range.  The average trajectory was nice to find because it gives me a good idea/prediction of how the paper plane will fly generally.

  # Code Listing
  [Paper Plane](PaperPlane.m)
  This MATLAB script simulates and plots variations of a paper plane for specific and random initial velocities and initial flight path angles;
  it also fits a line to the random runs, which becomes the average trajectory, and calculates the first-time derivatives of height and range of 
  the average trajectory.
  
  [Fourth-Order Equations of Aircraft Motion](EqMotion.m)
  This MATLAB script calculates the fourth-order equations of motion for an aircraft.
  
  # Figures

  ## Fig. 1: Single Parameter Variation
  ![Case A Variations](https://github.com/nlawrynk/Final_Project/assets/167822324/f21b940b-cfd7-4d90-a591-d898ac9c2698)

  The figure above displays two different scenarios.  The top plot shows what happens if you vary the initial velocity of the paper plane 
  given a minimum, maximum, and nominal initial velocity.  The bottom plot shows what happens if you vary the flight path angle of the paper 
  plane given a minimum, maximum, and nominal initial flight path angle.  The nominal lines seem to be linear for their entire flights which 
  makes sense because the paper plane is released at its ideal velocity or ideal flight path angle for it to achieve the least amount of setbacks 
  during its flight.

  ## Fig. 2: Monte Carlo Simulation
  ![Random Variations](https://github.com/nlawrynk/Final_Project/assets/167822324/9245eb19-bae6-4768-9831-0315b836b5c9)
  
  The figure above displays multiple orange lines that represent the variation of initial velocity and initial flight path angle for 100 runs.
  The initial velocity and the initial flight path angle for these 100 runs were chosen at random, which is why no two lines are the same.  The
  black line is a 7th-order polynomial fit to the 100 random runs and displays the average trajectory of all the runs.
  
  ## Fig. 3: Time Derivatives
  ![First Time Derivatives](https://github.com/nlawrynk/Final_Project/assets/167822324/807cfdd2-6fa5-4ab0-8bee-6d51a513374d)

  The above graph displays two different time derivatives. The above graph is the first-time derivative of height and it shows the rate at which 
  height changes throughout the flight of the average trajectory.  The rate at which the height changes seems to level out after a certain amount of time
  which makes sense because the average trajectory seems to be linear after a little bit. The lower graph is the first-time derivative of the range 
  and it shows the rate at which the range changes throughout the flight of the average trajectory.  The rate at which the range changes seems to level off 
  off between 2 and 5 seconds which makes sense because the average trajectory seems to be linear for that period.
  
