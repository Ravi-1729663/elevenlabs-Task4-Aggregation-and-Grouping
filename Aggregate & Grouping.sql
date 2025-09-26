-- ========================================================
-- Task 4: Aggregate Functions & Grouping
 
-- Purpose : Demonstrate summarization using COUNT, SUM, AVG,
--           along with GROUP BY and HAVING clauses.
-- ========================================================

USE connects;

-- ========================
-- 1. COUNT Examples
-- ========================

-- Count total users
SELECT COUNT(*) AS total_users
FROM Users;

-- Count posts by each user
SELECT user_id, COUNT(*) AS total_posts
FROM Posts
GROUP BY user_id;

-- Count comments per post
SELECT post_id, COUNT(*) AS total_comments
FROM Comments
GROUP BY post_id
ORDER BY total_comments DESC;

-- ========================
-- 2. SUM Examples
-- ========================

-- Sum of all post likes
SELECT SUM(like_count) AS total_likes
FROM Posts;

-- Total likes grouped by user
SELECT user_id, SUM(like_count) AS likes_given
FROM Posts
GROUP BY user_id;

-- ========================
-- 3. AVG Examples
-- ========================

-- Average likes per post
SELECT AVG(like_count) AS avg_likes_per_post
FROM Posts;

-- Average post count per user
SELECT user_id, AVG(comment_count) AS avg_comments
FROM Posts
GROUP BY user_id;

-- ========================
-- 4. GROUP BY + HAVING
-- ========================

-- Show users who created more than 1 post
SELECT user_id, COUNT(*) AS post_count
FROM Posts
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Show hashtags used in more than one post
SELECT hashtag_id, COUNT(post_id) AS usage_count
FROM Post_Hashtag
GROUP BY hashtag_id
HAVING COUNT(post_id) > 1;

-- Count reactions by type, but only show reaction types used more than once
SELECT type, COUNT(*) AS reaction_count
FROM Reactions
GROUP BY type
HAVING COUNT(*) > 1
ORDER BY reaction_count DESC;

-- ========================================================
-- End of Task 4 Script
-- ========================================================
