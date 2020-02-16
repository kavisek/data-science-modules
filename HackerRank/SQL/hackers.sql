-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.


SELECT * FROM SUBMISSIONS

SELECT
  HACKERS.hacker_id
  CASE WHEN SUBMISSIONS.score >= DIFFICULTY.score THEN 'Passed'
  ELSE 'Failed' END AS completion
FROM SUBMISSIONS
LEFT JOIN HACKERS ON HACKERS.hacker_id = SUBMISSIONS.hacker_id
LEFT JOIN CHALLENGES ON CHALLENGES.challenge_id = SUBMISSIONS.challenge_id
LEFT JOIN DIFFICULTY ON DIFFICULTY.difficulty_level = CHALLENGES.difficulty_level
