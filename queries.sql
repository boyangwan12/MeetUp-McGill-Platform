-- ========================================
-- Section: SQL Queries for Analysis
-- ========================================

# -------------Query 1: Show Groups by Category-----------
# - Query Objective: Display all groups within a specified category, ordered by the number of members in descending order.
# - Business Scenario: Useful for showing popular and active groups to potential members or employees.

SELECT 
    category, 
    nb_members, 
    groupid, 
    groupname, 
    area
FROM 
    `Group`
WHERE 
    category = 'Tech'
ORDER BY 
    nb_members DESC;


# -------------Query 2: List Activities by Month-----------
# - Query Objective: List all activities occurring in a specific month.
# - Business Scenario: Helps users or administrators manage events within a given timeframe.

SELECT 
    a.activityid, 
    a.activityname, 
    a.duration, 
    a.starttime, 
    a.location, 
    a.capacity, 
    a.groupid
FROM 
    Activity a
JOIN 
    RSVP r ON a.activityid = r.activityid
WHERE 
    MONTH(r.rsvp_month) = 4 -- Replace with desired month
GROUP BY 
    a.activityid, 
    a.activityname, 
    a.duration, 
    a.starttime, 
    a.location, 
    a.capacity, 
    a.groupid;


# -------------Query 3: Average Number of Activities per Student by Program-----------
# - Query Objective: Calculate the average number of activities per student for each program.
# - Business Scenario: Helps identify the most or least engaged academic programs.

SELECT 
    s.program, 
    COUNT(a.activityid) / NULLIF(COUNT(DISTINCT s.studentid), 0) AS avg_activities_per_student
FROM 
    Student s
JOIN 
    Activity a ON s.studentid = a.studentid
GROUP BY 
    s.program
ORDER BY 
    avg_activities_per_student DESC;


# -------------Query 4: Identify Students with the Most Likes on Reviews-----------
# - Query Objective: Find students who received the most likes on their reviews.
# - Business Scenario: Identify influential students for promotional or engagement activities.

SELECT 
    s.name, 
    SUM(r.nb_likes) AS total_likes
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
JOIN 
    Reviews r ON rsvp.rsvpid = r.rsvpid
GROUP BY 
    s.name
ORDER BY 
    total_likes DESC
LIMIT 5;


# -------------Query 5: Identify Top 5 Students in the Most Diverse Activities-----------
# - Query Objective: Identify students participating in the most diverse range of activities.
# - Business Scenario: Helps target cross-promotional strategies for diverse interests.

SELECT 
    s.name, 
    COUNT(DISTINCT a.activityid) AS total_unique_activities
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
JOIN 
    Activity a ON rsvp.activityid = a.activityid
GROUP BY 
    s.name
ORDER BY 
    total_unique_activities DESC
LIMIT 5;


# -------------Query 6: Identify Students with Consistent High or Low Ratings-----------
# - Query Objective: Find students who consistently give either high or low ratings.
# - Business Scenario: Helps identify satisfaction trends or biases for deeper analysis.

SELECT 
    s.name, 
    AVG(r.reviewRating) AS avg_review_rating
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
JOIN 
    Reviews r ON rsvp.rsvpid = r.rsvpid
GROUP BY 
    s.name
HAVING 
    AVG(r.reviewRating) >= 4 OR AVG(r.reviewRating) <= 2
ORDER BY 
    avg_review_rating ASC;


# -------------Query 7: Calculate the Engagement Rate of Each Group-----------
# - Query Objective: Calculate the engagement rate (RSVPs/members) for each group.
# - Business Scenario: Identify groups with high or low member engagement.

SELECT 
    g.groupid, 
    g.groupname, 
    COUNT(DISTINCT m.studentid) / NULLIF(g.nb_members, 0) AS engagement_rate
FROM 
    `Group` g
JOIN 
    Membership m ON g.groupid = m.groupid
JOIN 
    RSVP rsvp ON rsvp.studentid = m.studentid
WHERE 
    rsvp.rsvpid IS NOT NULL
GROUP BY 
    g.groupid;


# -------------Query 8: Determine the Number of Groups Created by Each Program-----------
# - Query Objective: Count the number of groups created by students in each program.
# - Business Scenario: Helps measure program-level community involvement.

SELECT 
    s.program, 
    COUNT(g.groupid) AS total_groups_created
FROM 
    Student s
JOIN 
    Membership m ON s.studentid = m.studentid
JOIN 
    `Group` g ON m.groupid = g.groupid
WHERE 
    m.membershipLevel = 'Creator'
GROUP BY 
    s.program
ORDER BY 
    total_groups_created DESC;


# -------------Query 9: Identify the Most Active Groups-----------
# - Query Objective: Identify the groups hosting the most activities.
# - Business Scenario: Recognize active groups contributing to community engagement.

SELECT 
    g.groupname, 
    COUNT(a.activityid) AS total_events
FROM 
    `Group` g
JOIN 
    Activity a ON g.groupid = a.groupid
GROUP BY 
    g.groupname
ORDER BY 
    total_events DESC;


# -------------Query 10: Distribution of Student Participation by Graduation Year-----------
# - Query Objective: Analyze student participation across different graduation years.
# - Business Scenario: Understand how engagement varies by academic stage.

SELECT 
    s.graduationyear, 
    COUNT(DISTINCT rsvp.rsvpid) AS total_participants
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
GROUP BY 
    s.graduationyear
ORDER BY 
    s.graduationyear;


# -------------Query 11: Impact of Language Proficiency on Activity Attendance-----------
# - Query Objective: Analyze the correlation between language proficiency and activity attendance.
# - Business Scenario: Improve event inclusivity for diverse language speakers.

SELECT 
    s.languages, 
    COUNT(rsvp.rsvpid) AS total_attendance
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
GROUP BY 
    s.languages
ORDER BY 
    total_attendance DESC;


# -------------Query 12: Evaluate the Impact of Student Demographics on Engagement-----------
# - Query Objective: Assess how student demographics influence activity participation.
# - Business Scenario: Tailor events to specific student groups based on engagement patterns.

SELECT 
    s.program, 
    s.hobbies, 
    COUNT(rsvp.rsvpid) AS total_engagement
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
GROUP BY 
    s.program, s.hobbies
ORDER BY 
    total_engagement DESC;

# -------------Query 13: Identify Students at Risk of Suspension Due to Non-Attendance-----------
# - Query Objective: Identify students who missed 2 or more RSVP commitments within a 30-day period.
# - Business Scenario: Helps flag students likely to impact event attendance, aiding proactive engagement efforts.

SELECT 
    s.studentid,
    s.name,
    COUNT(rsvp.rsvpid) AS missed_rsvps,
    MONTH(rsvp.rsvp_month) AS month
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
WHERE 
    rsvp.post_event_attendence = 'Did not attend'
GROUP BY 
    s.studentid, MONTH(rsvp.rsvp_month)
HAVING 
    COUNT(rsvp.rsvpid) >= 2
ORDER BY 
    missed_rsvps DESC;


# -------------Query 14: Identify the Most Popular Times of Day for Hosting Activities-----------
# - Query Objective: Find the times of day with the highest attendance for activities.
# - Business Scenario: Helps optimize scheduling for maximum engagement.

SELECT 
    a.starttime, 
    COUNT(rsvp.rsvpid) AS total_attendance
FROM 
    Activity a
JOIN 
    RSVP rsvp ON a.activityid = rsvp.activityid
GROUP BY 
    a.starttime
ORDER BY 
    total_attendance DESC;


# -------------Query 15: Identify the Most Attractive Locations for Hosting Activities-----------
# - Query Objective: Determine which locations attract the most participants.
# - Business Scenario: Helps select venues for future events based on popularity.

SELECT 
    a.location, 
    COUNT(DISTINCT s.studentid) AS number_of_students
FROM 
    Activity a
JOIN 
    RSVP rsvp ON a.activityid = rsvp.activityid
JOIN 
    Student s ON rsvp.studentid = s.studentid
GROUP BY 
    a.location
ORDER BY 
    number_of_students DESC;


# -------------Query 16: Analyze Monthly Attendance Trends-----------
# - Query Objective: Count RSVPs for activities across different months.
# - Business Scenario: Helps identify peak periods for event participation.

SELECT 
    MONTH(rsvp.rsvp_month) AS month, 
    COUNT(rsvp.rsvpid) AS total_attendance
FROM 
    RSVP rsvp
GROUP BY 
    MONTH(rsvp.rsvp_month)
ORDER BY 
    month ASC;


# -------------Query 17: Identify Which Graduation Year Students Create the Most Groups-----------
# - Query Objective: Find the graduation years with the most group creators.
# - Business Scenario: Helps foster leadership by identifying active cohorts.

SELECT 
    s.graduationyear,
    COUNT(m.membershipID) AS number_of_creators
FROM 
    Student s
JOIN 
    Membership m ON s.studentid = m.studentid
WHERE 
    m.membershipLevel = 'Creator'
GROUP BY 
    s.graduationyear
ORDER BY 
    number_of_creators DESC;


# -------------Query 18: Find the Most Popular Category Among Each Grade (Graduation Year)-----------
# - Query Objective: Identify the most popular group category for each graduation year.
# - Business Scenario: Tailor group offerings to student cohort preferences.

SELECT 
    s.graduationyear,
    g.category,
    COUNT(g.groupid) AS group_count
FROM 
    Student s
JOIN 
    Membership m ON s.studentid = m.studentid
JOIN 
    `Group` g ON m.groupid = g.groupid
GROUP BY 
    s.graduationyear, g.category
ORDER BY 
    s.graduationyear DESC, group_count DESC;


# -------------Query 19: Identify Top 5 Highly Engaged and Positive-Rating Students-----------
# - Query Objective: Identify students with high engagement and positive ratings.
# - Business Scenario: Recognize influencers who can promote community engagement.

SELECT 
    s.name,
    COUNT(DISTINCT a.activityid) AS total_unique_activities,
    AVG(r.reviewRating) AS avg_review_rating
FROM 
    Student s
JOIN 
    RSVP rsvp ON s.studentid = rsvp.studentid
JOIN 
    Activity a ON rsvp.activityid = a.activityid
JOIN 
    Reviews r ON rsvp.rsvpid = r.rsvpid
WHERE 
    r.reviewRating IS NOT NULL
GROUP BY 
    s.name
HAVING 
    COUNT(DISTINCT a.activityid) >= 3
    AND AVG(r.reviewRating) >= 3.5
ORDER BY 
    total_unique_activities DESC, avg_review_rating DESC
LIMIT 5;


# -------------Query 20: Evaluate the Successfulness of Groups-----------
# - Query Objective: Assign a quality score to groups based on engagement, activity ratings, and likes.
# - Business Scenario: Helps allocate resources to high-performing groups.

SELECT 
    g.groupid,
    g.groupname,
    g.nb_members,
    COUNT(r.rsvpid) AS total_rsvps,
    AVG(rv.reviewRating) AS average_review_rating,
    SUM(rv.nb_likes) AS total_likes,
    (
        -- Normalize and weight attributes to calculate a quality score
        (g.nb_members / (SELECT MAX(nb_members) FROM `Group`) * 10 * 0.4) +
        (COUNT(r.rsvpid) / 
            (SELECT MAX(total_rsvps) 
             FROM (SELECT COUNT(r2.rsvpid) AS total_rsvps 
                   FROM RSVP r2 
                   JOIN Activity a2 ON r2.activityid = a2.activityid 
                   GROUP BY a2.groupid) AS subquery_rsvps) * 10 * 0.3) +
        (AVG(rv.reviewRating) / 5 * 10 * 0.2) +
        (SUM(rv.nb_likes) / 
            (SELECT MAX(total_likes) 
             FROM (SELECT SUM(rv2.nb_likes) AS total_likes 
                   FROM Reviews rv2 
                   JOIN RSVP r3 ON rv2.rsvpid = r3.rsvpid 
                   JOIN Activity a3 ON r3.activityid = a3.activityid 
                   GROUP BY a3.groupid) AS subquery_likes) * 10 * 0.1)
    ) AS group_quality_score
FROM 
    `Group` g
LEFT JOIN 
    Activity a ON g.groupid = a.groupid
LEFT JOIN 
    RSVP r ON a.activityid = r.activityid
LEFT JOIN 
    Reviews rv ON r.rsvpid = rv.rsvpid
GROUP BY 
    g.groupid, g.groupname
ORDER BY 
    group_quality_score DESC;