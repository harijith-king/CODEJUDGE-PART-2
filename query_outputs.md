OUTPUTS of the QUERIES

## 1.List all active students with student ID, name, email, batch, and admission date.
 -- 1st 4 lines of the output

  S0001	Vivaan Gupta	vivaan.gupta001@codejudge.edu	CSE2025B	2025-02-13
  
  S0002	Harsh Das	harsh.das002@codejudge.edu	MCA2025A	2025-04-08
  
  S0003	Ira Pillai	ira.pillai003@codejudge.edu	BCA2025A	2025-02-19
  
  S0004	Ananya Bose	ananya.bose004@codejudge.edu	CSE2026A	2025-02-19  
  
  

## 2.Find students whose email is missing or appears invalid.
  student_id	  full_name    	email
  
    S0005	    Ayaan Gupta	  NULL
    S0018	    Anika Patel  	ravi.no-at-symbol.codejudge.edu

## 3. List all problems with difficulty level Easy or Medium.
 -- 1st 4 lines of the output
    
    problem_id	title	                     difficulty	max_score
  
    P0001	    Shortest Path 1	              Medium	  75
    P0002	    Dynamic Programming Basics 2	Easy	    50
    P0003	    Dynamic Programming Basics 3	Easy	    50
    P0004    	Normalization Check 4	        Easy	    50

## 4. Display the latest 20 submissions based on submission timestamp.

    submission_id	student_id	problem_id	submitted_at	status	score
  
    SUB001091	S0074	P0025	2025-08-12 03:44:00	Runtime Error	12
    SUB001593	S0007	P0005	2025-08-05 20:47:00	Accepted	50
    SUB000123	S0002	P0067	2025-08-04 15:30:00	Accepted	50
    SUB001144	S0007	P0006	2025-07-31 02:49:00	Compilation Error	0
    SUB000878	S0142	P0066	2025-07-31 01:38:00	Accepted	75
    SUB002438	S0207	P0018	2025-07-30 11:25:00	Accepted	100
    SUB000569	S0002	P0020	2025-07-27 04:20:00	Accepted	50
    SUB000751	S0120	P0015	2025-07-27 01:11:00	Wrong Answer	28
    SUB001740	S0052	P0047	2025-07-24 17:14:00	Compilation Error	0
    SUB000500	S0283	P0028	2025-07-23 11:17:00	Accepted	75
    SUB001072	S0283	P0062	2025-07-23 08:44:00	Runtime Error	15
    SUB000947	S0151	P0001	2025-07-22 12:01:00	Accepted	75
    SUB002483	S0007	P0016	2025-07-20 09:48:00	Accepted	50
    SUB000622	S0146	P0035	2025-07-20 08:19:00	Runtime Error	26
    SUB000704	S0149	P0039	2025-07-19 03:37:00	Wrong Answer	35
    SUB001744	S0178	P0020	2025-07-18 21:40:00	Compilation Error	0
    SUB000542	S0051	P0010	2025-07-17 19:21:00	Accepted	50
    SUB002063	S0093	P0008	2025-07-14 05:11:00	Time Limit Exceeded	18
    SUB001638	S0151	P0030	2025-07-14 04:51:00	Wrong Answer	59
    SUB001394	S0080	P0052	2025-07-14 03:29:00	Runtime Error	1

## 5. Find submissions where the status is not successful.
 -- 1st 4 lines of the output
 
    submission_id	student_id	problem_id	status	score
    SUB000001	S0282	P0043	Wrong Answer	46
    SUB000002	S0289	P0028	Wrong Answer	46
    SUB000003	S0001	P0005	Wrong Answer	19
    SUB000006	S0154	P0012	Compilation Error	0

## 6. Display each submission with student name, problem title, language, status, score and submitted time.'
 -- 1st 4 lines of the output
 
    submission_id	full_name	title	language	status	score	submitted_at
    SUB000001	Isha Gupta	Dynamic Programming Basics 43	C	Wrong Answer	46	2025-05-14 13:48:00
    SUB000002	Kunal Singh	Valid Parentheses 28	JavaScript	Wrong Answer	46	2025-03-21 17:59:00
    SUB000003	Vivaan Gupta	Queue using Stacks 5	C++	Wrong Answer	19	2025-04-09 19:01:00
    SUB000004	Saanvi Bose	Two Sum 42	Python	Accepted	50	2025-02-03 22:52:00


## 7. Display all students and their enrollments,including students who are not enrolled in any course.'
 -- 1st 4 lines of the output
 
     student_id	full_name	course_title	enrollment_status
    S0001	Vivaan Gupta	Programming Fundamentals	active
    S0001	Vivaan Gupta	Computer Networks	active
    S0002	Harsh Das	Object Oriented Programming	active
    S0002	Harsh Das	Software Engineering	active
    S0003	Ira Pillai	Algorithms	active
    S0004	Ananya Bose	Programming Fundamentals	active
    S0004	Ananya Bose	Data Structures	completed


## 9. Display test-case results for each submission,including problem title and student name.
 -- 1st 4 lines of the output
 
    result_id	full_name	title	result_status	runtime_ms
    R0000001	Isha Gupta	Dynamic Programming Basics 43	Runtime Error	586
    R0000002	Isha Gupta	Dynamic Programming Basics 43	Failed	3549
    R0000003	Isha Gupta	Dynamic Programming Basics 43	Runtime Error	3075
    R0000004	Isha Gupta	Dynamic Programming Basics 43	Time Limit Exceeded	2913
    R0000005	Isha Gupta	Dynamic Programming Basics 43	Passed	3870

## 10. Find students who are enrolled in a course but have not submitted any solution for that course.
 -- 1st 4 lines of the output

    student_id full_name course_title
    S0001	Vivaan Gupta	Computer Networks
    S0001	Vivaan Gupta	Programming Fundamentals
    S0002	Harsh Das	Software Engineering
    S0002	Harsh Das	Object Oriented Programming
    S0003	Ira Pillai	Algorithms
    S0004	Ananya Bose	Programming Fundamentals
    S0004	Ananya Bose	Data Structures

##  11. count submissions by status

    status	            total
    Accepted	          1127
    Compilation Error  	196
    OK	                1
    Runtime Error	      277
    Time Limit Exceeded	171
    Wrong Answer	      729
    
## 12. calculate average score per problem

      title                        avg_score
    Shortest Path 1    	          51.6415094339623
    Dynamic Programming Basics 2	36.5714285714286
    Dynamic Programming Basics 3	35.4375
    Normalization Check 4	        33.125
    Queue using Stacks 5	        32.46875
    Graph Traversal 6	            59.3695652173913
    Graph Traversal 7	            51.5

## 13. find students with more than 10 submissions
--1st 4 lines of the output

    full_name       total_submissions
    Isha Mehta	      14
    Reyansh Kulkarni	12
    Gaurav Das	      11
    Sneha Reddy	      11
    Priya Sharma	    11
    Myra Iyer        	12

## 14. find problems where success rate is below 40 percent

    title              total accepted success_rate
    Queue using Stacks 5	64	22	34.38
    LRU Cache 8	          72  24	33.33
    Knapsack 10	          68  26	38.24
    Queue using Stacks 12	78	28	35.9
    Database Indexing 20	64	22	34.38
    Valid Parentheses 28  76	24	31.58

## 15. find top 10 most attempted problems

    title	                    attempts
    Graph Traversal 40	          110
    Dynamic Programming Basics 19	106
    Shortest Path 1	              106
    Deadlock Detection 45         98
    Dynamic Programming Basics 43	98
    Tree Diameter 24	            96
    Valid Parentheses 32	        94
    Deadlock Detection 16	        94
    Dynamic Programming Basics 13	94
    Graph Traversal 6	            92

## 16.



