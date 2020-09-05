# Calculate_Vampire_Numbers

Problem definition : 

An interesting kind of number in mathematics is vampire number (Links to an external site.). A vampire number is a composite (Links to an external site.) natural number (Links to an external site.) with an even number of digits, that can be factored into two natural numbers each with half as many digits as the original number and not both with trailing zeroes, where the two factors contain precisely all the digits of the original number, in any order, counting multiplicity.  

A classic example is: 
```
1260 = 21 x 60.
```

A vampire number can have multiple distinct pairs of fangs. A vampire numbers with 2 pairs of fangs is:
```
125460 = 204 × 615 = 246 × 510.
```
The goal of this first project is to use Elixir and the actor model to build a good solution to this problem that runs well on multi-core machines.

Requirements

Input: The input provided (as command line to your program, e.g. my_app) will be two numbers: N1 and N2. The overall goal of your program is to find all vampire numbers starting at N1 and up to N2.

Output: Print, on independent lines, first the number then its fangs. If there are multiple fangs list all of them next to each other like it’s shown in the example below.

File name should be proj1.

Example:
```
mix run proj1.exs 100000 200000

125460 204 615 246 510
```
This output indicates that a vampire number between 100000 and 200000 is 125460 and its possible pair of fangs are: 204, 615 and 246, 510.

Actor modeling: In this project, The actor facility in Elixir was used. In particular, worker actors were defined and are given a range of problems to solve and a boss that keeps track of all the problems and perform the job assignment.

How to Build the project : 
1. Open the terminal and navigate to project directory and type the following commands
2. mix compile 
3. mix run Proj1.exs 100000 200000


Observations and Result:

1. 1000 worker actors were created if the range was greater than 1000. else numbers of workers = max(1,range-1)
2. The range was divided into 1000 equal interval and each worker was given one interval each. We tried various combinations for ranges of around 100000, 200000, 500000 with 100, 1000, and 10000 workers and saw this as optimum 

3. Output for mix run proj1.exs 100000 200000
```
197725 275 719
193945 395 491
193257 327 591
192150 210 915
190260 210 906
186624 216 864
180297 201 897
180225 225 801
182650 281 650
182250 225 810
175329 231 759
174370 371 470
173250 231 750
172822 221 782
163944 396 414
162976 176 926
156915 165 951
156289 269 581
156240 240 651
152685 261 585
152608 251 608
153436 356 431
150300 300 501
146952 156 942
145314 351 414
146137 317 461
140350 350 401
136948 146 938
136525 215 635
135837 351 387
135828 231 588
134725 317 425
133245 315 423
132430 323 410
131242 311 422
129640 140 926
129775 179 725
126027 201 627
125500 251 500
125460 204 615 246 510
125433 231 543
126846 261 486
125248 152 824
124483 281 443
123354 231 534
120600 201 600
104260 260 401
110758 158 701
118440 141 840
102510 201 510
116725 161 725
105264 204 516
105210 210 501
115672 152 761
117067 167 701
108135 135 801
105750 150 705
```
4.  - CPU time: 0m3.301s
    - Real time: 0m0.739s
    - Ratio(~number of cores) : 4.47
	
5. Vampire numbers are found for the range 90000000 to 100000000. 96977920 is the largest vampire number in that range
