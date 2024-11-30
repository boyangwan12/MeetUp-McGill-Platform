-- ========================================
-- Section: Database Schema Creation
-- ========================================

-- Table for Student
CREATE TABLE Student (
    studentid INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(255) UNIQUE NOT NULL,
    program VARCHAR(255),
    hobbies VARCHAR(255),
    languages VARCHAR(255),
    graduationyear INT,
    country VARCHAR(255)
);

-- Table for Group
CREATE TABLE `Group` (
    groupid INT PRIMARY KEY,
    category VARCHAR(50),
    groupname VARCHAR(50) UNIQUE NOT NULL,
    nb_members INT,
    area VARCHAR(255)
);

-- Table for Activity
CREATE TABLE Activity (
    activityid INT PRIMARY KEY,
    activityname VARCHAR(50),
    duration INT,
    starttime TIME NOT NULL,
    location VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    groupid INT,
    studentid INT,
    FOREIGN KEY (groupid) REFERENCES `Group`(groupid),
    FOREIGN KEY (studentid) REFERENCES Student(studentid)
);

-- Table for RSVP
CREATE TABLE RSVP (
    rsvpid INT PRIMARY KEY,
    studentid INT,
    activityid INT,
    rsvp_month DATE,
    rsvp_status VARCHAR(50) CHECK (rsvp_status IN ('Attending', 'Maybe')),
    post_event_attendence VARCHAR(50) CHECK (post_event_attendence IN ('Attended', 'Did not attend')),
    FOREIGN KEY (studentid) REFERENCES Student(studentid),
    FOREIGN KEY (activityid) REFERENCES Activity(activityid)
);

-- Table for Reviews
CREATE TABLE Reviews (
    review_ID INT PRIMARY KEY,
    review_text VARCHAR(255),
    reviewRating INT,
    nb_likes INT,
    rsvpid INT,
    FOREIGN KEY (rsvpid) REFERENCES RSVP(rsvpid)
);

-- Table for Membership
CREATE TABLE Membership (
    membershipID INT PRIMARY KEY,
    membershipLevel VARCHAR(255),
    groupid INT,
    studentid INT,
    FOREIGN KEY (groupid) REFERENCES `Group`(groupid),
    FOREIGN KEY (studentid) REFERENCES Student(studentid)
);

-- ========================================
-- Section: Sample Data Insertion
-- ========================================
-- Sample Data for Student table
INSERT INTO Student (studentid, name, email, program, hobbies, languages, graduationyear, country) VALUES
(1, 'John Doe', 'johndoe@mail.mcgill.ca', 'Computer Science', 'Reading, Gaming', 'English, Spanish', 2024, 'USA'),
(2, 'Jane Smith', 'janesmith@mail.mcgill.ca', 'Business Administration', 'Hiking, Photography', 'English, French', 2023, 'Canada'),
(3, 'Alice Johnson', 'alicejohnson@mail.mcgill.ca', 'Engineering', 'Cooking, Music', 'English', 2025, 'UK'),
(4, 'Bob Brown', 'bobbrown@mail.mcgill.ca', 'Mathematics', 'Chess, Running', 'English, German', 2024, 'Germany'),
(5, 'Eve Davis', 'evedavis@mail.mcgill.ca', 'Literature', 'Writing, Traveling', 'English', 2026, 'Australia'),
(6, 'Charlie Evans', 'charlieevans@mail.mcgill.ca', 'Computer Science', 'Photography, Cycling', 'English', 2024, 'USA'),
(7, 'Diana Garcia', 'dianagarcia@mail.mcgill.ca', 'Business Administration', 'Swimming, Hiking', 'English, Spanish', 2023, 'Mexico'),
(8, 'Frank Harris', 'frankharris@mail.mcgill.ca', 'Engineering', 'Reading, Traveling', 'English', 2025, 'UK'),
(9, 'Grace Lee', 'gracelee@mail.mcgill.ca', 'Computer Science', 'Cooking, Running', 'English, Chinese', 2024, 'China'),
(10, 'Henry Wilson', 'henrywilson@mail.mcgill.ca', 'Business Administration', 'Writing, Chess', 'English, French', 2023, 'France'),
(11, 'Isabella Martinez', 'isabellamartinez@mail.mcgill.ca', 'Computer Science', 'Painting, Gaming', 'English, Spanish', 2024, 'Spain'),
(12, 'Jack Robinson', 'jackrobinson@mail.mcgill.ca', 'Engineering', 'Photography, Reading', 'English, German', 2025, 'Germany'),
(13, 'Kelly Adams', 'kellyadams@mail.mcgill.ca', 'Computer Science', 'Music, Traveling', 'English', 2026, 'Australia'),
(14, 'Leo Scott', 'leoscott@mail.mcgill.ca', 'Mathematics', 'Drawing, Running', 'English', 2023, 'USA'),
(15, 'Mia White', 'miawhite@mail.mcgill.ca', 'Business Administration', 'Writing, Hiking', 'English', 2024, 'Canada'),
(16, 'Nina Clark', 'ninaclark@mail.mcgill.ca', 'Literature', 'Painting, Chess', 'English, Italian', 2025, 'Italy'),
(17, 'Oscar Hill', 'oscarhill@mail.mcgill.ca', 'Computer Science', 'Gaming, Running', 'English, German', 2024, 'Germany'),
(18, 'Paula King', 'paulaking@mail.mcgill.ca', 'Business Administration', 'Reading, Traveling', 'English', 2026, 'UK'),
(19, 'Quinn Baker', 'quinnbaker@mail.mcgill.ca', 'Engineering', 'Cycling, Cooking', 'English, French', 2023, 'France'),
(20, 'Rita Carter', 'ritacarter@mail.mcgill.ca', 'Computer Science', 'Swimming, Photography', 'English, Spanish', 2024, 'Spain'),
(21, 'Steve Green', 'stevegreen@mail.mcgill.ca', 'Computer Science', 'Gaming, Hiking', 'English', 2025, 'USA'),
(22, 'Tina Young', 'tinayoung@mail.mcgill.ca', 'Engineering', 'Running, Traveling', 'English, Chinese', 2024, 'China'),
(23, 'Ursula Hughes', 'ursulahughes@mail.mcgill.ca', 'Mathematics', 'Reading, Painting', 'English, Spanish', 2023, 'Mexico'),
(24, 'Victor Hall', 'victorhall@mail.mcgill.ca', 'Computer Science', 'Chess, Writing', 'English, German', 2025, 'Germany'),
(25, 'Wendy Wright', 'wendywright@mail.mcgill.ca', 'Business Administration', 'Photography, Running', 'English, French', 2024, 'Canada'),
(26, 'Xavier Perez', 'xavierperez@mail.mcgill.ca', 'Computer Science', 'Gaming, Hiking', 'English, Spanish', 2026, 'Spain'),
(27, 'Yvonne Turner', 'yvonneturner@mail.mcgill.ca', 'Computer Science', 'Cooking, Traveling', 'English, Italian', 2023, 'Italy'),
(28, 'Zachary Foster', 'zacharyfoster@mail.mcgill.ca', 'Computer Science', 'Music, Reading', 'English, French', 2024, 'France'),
(29, 'Anna Sanders', 'annasanders@mail.mcgill.ca', 'Business Administration', 'Writing, Photography', 'English, Spanish', 2025, 'UK'),
(30, 'Brian Morgan', 'brianmorgan@mail.mcgill.ca', 'Computer Science', 'Gaming, Traveling', 'English, German', 2023, 'USA');
 
-- Sample Data for Group
INSERT INTO `Group` (groupid, category, groupname, nb_members, area) VALUES
(1, 'Tech', 'AI Enthusiasts', 15, 'Silicon Valley'),
(2, 'Tech', 'Blockchain Innovators', 15, 'Austin'),
(3, 'Tech', 'Cybersecurity Experts', 15, 'Washington D.C.'),
(4, 'Business', 'Startup Founders', 5, 'New York'),
(5, 'Business', 'Marketing Gurus', 5, 'Chicago'),
(6, 'Business', 'E-commerce Entrepreneurs', 5, 'San Diego'),
(7, 'Travel', 'Adventure Travelers', 5, 'Seattle'),
(8, 'Travel', 'Cultural Explorers', 5, 'New Orleans'),
(9, 'Travel', 'Backpackers Club', 4, 'Denver'),
(10, 'Photography', 'Nature Photographers', 5, 'Los Angeles'),
(11, 'Photography', 'Urban Photographers', 5, 'San Francisco'),
(12, 'Cooking', 'Gourmet Chefs', 5, 'Boston'),
(13, 'Cooking', 'Baking Enthusiasts', 5, 'Portland'),
(14, 'Cooking', 'Vegan Cooks', 5, 'Los Angeles'),
(15, 'Cooking', 'BBQ Masters', 5, 'Kansas City'),
(16, 'Tech', 'App Developers', 5, 'Atlanta'),
(17, 'Tech', 'Web Designers', 5, 'San Jose'),
(18, 'Business', 'Financial Analysts', 5, 'Philadelphia'),
(19, 'Business', 'Real Estate Investors', 5, 'Miami'),
(20, 'Travel', 'Luxury Travelers', 5, 'Chicago'),
(21, 'Travel', 'Eco-tourists', 5, 'Boulder'),
(22, 'Photography', 'Portrait Photographers', 5, 'Nashville'),
(23, 'Photography', 'Street Photographers', 5, 'Brooklyn'),
(24, 'Cooking', 'Seafood Lovers', 5, 'Baltimore'),
(25, 'Cooking', 'Pasta Makers', 5, 'Rome'),
(26, 'Cooking', 'Dessert Makers', 5, 'Paris'),
(27, 'Tech', 'AI Researchers', 5, 'Boston'),
(28, 'Business', 'Startup Mentors', 5, 'Los Angeles'),
(29, 'Travel', 'Digital Nomads', 5, 'Lisbon'),
(30, 'Photography', 'Film Photographers', 6, 'San Francisco');
 
-- Sample Data for Activity
INSERT INTO Activity (activityid, activityname, duration, starttime, location, capacity, groupid, studentid) VALUES
(1, 'AI Workshop', 120, '09:00:00', 'Silicon Valley', 50, 1, 1),
(2, 'Blockchain Seminar', 90, '10:00:00', 'Austin', 40, 2, 2),
(3, 'Cybersecurity Training', 180, '14:00:00', 'Washington D.C.', 60, 3, 3),
(4, 'Startup Pitch', 150, '11:00:00', 'New York', 30, 4, 4),
(5, 'Marketing Strategies', 90, '13:00:00', 'Chicago', 50, 5, 5),
(6, 'E-commerce Trends', 120, '15:00:00', 'San Diego', 35, 6, 6),
(7, 'Hiking Adventure', 240, '08:00:00', 'Seattle', 20, 7, 7),
(8, 'Cultural Festival', 300, '10:00:00', 'New Orleans', 25, 8, 8),
(9, 'Backpacking Trip', 360, '07:00:00', 'Denver', 15, 9, 9),
(10, 'Nature Photography Walk', 180, '06:00:00', 'Los Angeles', 25, 10, 10),
(11, 'Urban Photo Shoot', 120, '09:00:00', 'San Francisco', 20, 11, 11),
(12, 'Gourmet Cooking Class', 150, '12:00:00', 'Boston', 28, 12, 12),
(13, 'Baking Workshop', 120, '10:00:00', 'Portland', 22, 13, 13),
(14, 'Vegan Cooking Demo', 90, '14:00:00', 'Los Angeles', 19, 14, 14),
(15, 'BBQ Competition', 240, '11:00:00', 'Kansas City', 30, 15, 15),
(16, 'App Development Bootcamp', 180, '09:00:00', 'Atlanta', 40, 16, 16),
(17, 'Web Design Sprint', 150, '10:00:00', 'San Jose', 30, 17, 17),
(18, 'Financial Analysis Workshop', 120, '14:00:00', 'Philadelphia', 25, 18, 18),
(19, 'Real Estate Investing Seminar', 90, '13:00:00', 'Miami', 20, 19, 19),
(20, 'Luxury Travel Planning', 240, '08:00:00', 'Chicago', 15, 20, 20),
(21, 'Eco-tourism Summit', 300, '07:00:00', 'Boulder', 20, 21, 21),
(22, 'Portrait Photography Session', 180, '09:00:00', 'Nashville', 15, 22, 22),
(23, 'Street Photography Walk', 120, '10:00:00', 'Brooklyn', 10, 23, 23),
(24, 'Seafood Cooking Class', 150, '11:00:00', 'Baltimore', 26, 24, 24),
(25, 'Pasta Making Workshop', 120, '13:00:00', 'Rome', 21, 25, 25),
(26, 'Dessert Masterclass', 90, '14:00:00', 'Paris', 23, 26, 26),
(27, 'AI Research Symposium', 180, '09:00:00', 'Boston', 40, 27, 1),
(28, 'Startup Mentorship Session', 120, '10:00:00', 'Los Angeles', 12, 28, 4),
(29, 'Digital Nomad Meetup', 300, '08:00:00', 'Lisbon', 14, 29, 3),
(30, 'Film Photography Workshop', 180, '09:00:00', 'San Francisco', 20, 30, 11),
(31, 'Advanced AI Workshop', 180, '14:00:00', 'Boston', 50, 27, 2),
(32, 'Blockchain Seminar', 90, '15:00:00', 'Austin', 40, 2, 2),
(33, 'Cybersecurity Training', 180, '16:00:00', 'Washington D.C.', 60, 3, 3),
(34, 'Startup Pitch', 150, '11:00:00', 'New York', 30, 4, 4),
(35, 'Marketing Strategies', 90, '13:00:00', 'Chicago', 50, 5, 5),
(36, 'Global E-commerce', 150, '15:00:00', 'San Diego', 25, 6, 6),
(37, 'Mountain Hiking', 300, '06:00:00', 'Seattle', 15, 7, 7),
(38, 'Music and Culture Fest', 240, '11:00:00', 'New Orleans', 20, 8, 10),
(39, 'Rock Climbing Trip', 360, '07:00:00', 'Denver', 10, 9, 9),
(40, 'Wildlife Photography', 180, '05:00:00', 'Los Angeles', 25, 10, 10),
(41, 'City Photography Tour', 120, '09:00:00', 'San Francisco', 15, 11, 11),
(42, 'Advanced Baking Class', 150, '12:00:00', 'Portland', 20, 13, 12),
(43, 'Vegan Desserts Demo', 90, '15:00:00', 'Los Angeles', 18, 14, 14),
(44, 'Grill Master BBQ', 240, '11:00:00', 'Kansas City', 35, 15, 15),
(45, 'AI & Machine Learning Bootcamp', 180, '09:00:00', 'Boston', 45, 1, 1),
(46, 'Blockchain for Developers', 90, '10:00:00', 'Austin', 30, 2, 2),
(47, 'Advanced Cybersecurity', 200, '14:00:00', 'Washington D.C.', 55, 3, 3),
(48, 'Startup Ecosystem', 120, '13:00:00', 'New York', 25, 4, 4),
(49, 'Marketing for Startups', 120, '11:00:00', 'Chicago', 35, 5, 5),
(50, 'Cross-Border E-commerce', 120, '15:00:00', 'San Diego', 30, 6, 6),
(51, 'Trail Running Adventure', 240, '06:00:00', 'Seattle', 20, 7, 7),
(52, 'Cultural Immersion Event', 300, '09:00:00', 'New Orleans', 25, 8, 8),
(53, 'Alpine Climbing Trip', 360, '07:00:00', 'Denver', 12, 9, 9),
(54, 'Sunset Photography', 180, '17:00:00', 'Los Angeles', 25, 10, 10),
(55, 'Urban Night Photography', 120, '21:00:00', 'San Francisco', 20, 11, 11),
(56, 'French Pastry Class', 150, '14:00:00', 'Boston', 28, 12, 12),
(57, 'Gluten-Free Baking', 120, '10:00:00', 'Portland', 22, 13, 13),
(58, 'Vegetarian Cooking Workshop', 90, '13:00:00', 'Los Angeles', 20, 14, 14),
(59, 'BBQ Techniques & Secrets', 240, '11:00:00', 'Kansas City', 40, 15, 15),
(60, 'AI for Beginners', 120, '09:00:00', 'Silicon Valley', 50, 1, 1),
(61, 'Blockchain & Smart Contracts', 120, '10:00:00', 'Austin', 35, 2, 2),
(62, 'Cyber Defense Strategies', 180, '14:00:00', 'Washington D.C.', 60, 3, 3),
(63, 'Pitching to Investors', 150, '11:00:00', 'New York', 30, 4, 4),
(64, 'Social Media Marketing', 90, '13:00:00', 'Chicago', 40, 5, 5),
(65, 'Advanced Marketing Techniques', 90, '12:00:00', 'Chicago', 30, 5, 5),
(66, 'Creative Writing Workshop', 150, '14:00:00', 'New York', 25, 4, 4),
(67, 'Sustainable Development Forum', 240, '09:00:00', 'Boulder', 20, 21, 7),
(68, 'Film Photography Workshop', 180, '09:00:00', 'San Francisco', 20, 30, 11),
(69, 'Digital Nomad Meetup', 300, '08:00:00', 'Lisbon', 14, 29, 3),
(70, 'Real Estate Masterclass', 120, '10:00:00', 'Miami', 20, 19, 6),
(71, 'AI Research Workshop', 180, '09:00:00', 'Boston', 50, 1, 1),
(72, 'Advanced Blockchain Seminar', 120, '10:00:00', 'Austin', 40, 2, 2),
(73, 'Advanced Cybersecurity Training', 200, '14:00:00', 'Washington D.C.', 60, 3, 3),
(74, 'Startup Pitch Competition', 150, '11:00:00', 'New York', 30, 4, 4),
(75, 'Marketing for Growth', 90, '13:00:00', 'Chicago', 50, 5, 5),
(76, 'E-commerce Global Trends', 120, '15:00:00', 'San Diego', 35, 6, 6),
(77, 'Leadership Summit', 240, '08:00:00', 'Seattle', 20, 7, 7),
(78, 'Cultural Awareness Workshop', 300, '10:00:00', 'New Orleans', 25, 8, 8),
(79, 'Photography Masterclass', 180, '06:00:00', 'Los Angeles', 25, 10, 10),
(80, 'Advanced Photography Techniques', 120, '09:00:00', 'San Francisco', 20, 11, 11); 
 
-- Sample Data for RSVP
INSERT INTO RSVP (rsvpid, studentid, activityid, rsvp_month, rsvp_status, post_event_attendence) VALUES
(1, 1, 1, '2024-01-15', 'Attending', 'Attended'),
(2, 2, 2, '2024-02-20', 'Maybe', 'Did not attend'),
(3, 3, 3, '2024-03-10', 'Attending', 'Attended'),
(4, 4, 4, '2024-04-12', 'Attending', 'Attended'),
(5, 5, 5, '2024-05-18', 'Maybe', 'Did not attend'),
(6, 6, 6, '2024-06-25', 'Attending', 'Attended'),
(7, 7, 7, '2024-07-08', 'Maybe', 'Did not attend'),
(8, 8, 8, '2024-08-19', 'Attending', 'Attended'),
(9, 9, 9, '2024-09-01', 'Attending', 'Attended'),
(10, 10, 10, '2024-10-13', 'Maybe', 'Did not attend'),
(11, 11, 11, '2024-11-03', 'Attending', 'Attended'),
(12, 12, 12, '2024-12-15', 'Attending', 'Attended'),
(13, 13, 13, '2024-01-25', 'Maybe', 'Did not attend'),
(14, 14, 14, '2024-02-28', 'Attending', 'Attended'),
(15, 15, 15, '2024-03-16', 'Attending', 'Attended'),
(16, 16, 16, '2024-04-22', 'Maybe', 'Did not attend'),
(17, 17, 17, '2024-05-30', 'Attending', 'Attended'),
(18, 18, 18, '2024-06-10', 'Attending', 'Attended'),
(19, 19, 19, '2024-07-20', 'Maybe', 'Did not attend'),
(20, 20, 20, '2024-08-14', 'Attending', 'Attended'),
(21, 21, 21, '2024-09-29', 'Attending', 'Attended'),
(22, 22, 22, '2024-10-05', 'Maybe', 'Did not attend'),
(23, 23, 23, '2024-11-18', 'Attending', 'Attended'),
(24, 24, 24, '2024-12-21', 'Attending', 'Attended'),
(25, 25, 25, '2024-01-14', 'Maybe', 'Did not attend'),
(26, 26, 26, '2024-02-26', 'Attending', 'Attended'),
(27, 27, 27, '2024-03-29', 'Attending', 'Attended'),
(28, 28, 28, '2024-04-17', 'Maybe', 'Did not attend'),
(29, 29, 29, '2024-05-22', 'Attending', 'Attended'),
(30, 30, 30, '2024-06-07', 'Attending', 'Attended'),
(31, 1, 2, '2024-07-15', 'Maybe', 'Did not attend'),
(32, 2, 4, '2024-08-22', 'Attending', 'Attended'),
(33, 3, 6, '2024-09-18', 'Attending', 'Attended'),
(34, 4, 8, '2024-10-12', 'Maybe', 'Did not attend'),
(35, 5, 10, '2024-11-05', 'Attending', 'Attended'),
(36, 6, 12, '2024-12-18', 'Attending', 'Attended'),
(37, 7, 14, '2024-01-10', 'Maybe', 'Did not attend'),
(38, 8, 16, '2024-02-14', 'Attending', 'Attended'),
(39, 9, 18, '2024-03-08', 'Attending', 'Attended'),
(40, 10, 20, '2024-04-24', 'Maybe', 'Did not attend'),
(41, 11, 22, '2024-05-29', 'Attending', 'Attended'),
(42, 12, 24, '2024-06-16', 'Attending', 'Attended'),
(43, 13, 26, '2024-07-02', 'Maybe', 'Did not attend'),
(44, 14, 28, '2024-08-11', 'Attending', 'Attended'),
(45, 15, 30, '2024-09-25', 'Attending', 'Attended'),
(46, 1, 3, '2024-02-10', 'Attending', 'Attended'),
(47, 1, 4, '2024-03-22', 'Maybe', 'Did not attend'),
(48, 2, 5, '2024-04-18', 'Attending', 'Attended'),
(49, 2, 7, '2024-05-30', 'Maybe', 'Did not attend'),
(50, 3, 9, '2024-06-15', 'Attending', 'Attended'),
(51, 3, 10, '2024-07-12', 'Attending', 'Attended'),
(52, 4, 12, '2024-08-25', 'Maybe', 'Did not attend'),
(53, 4, 13, '2024-09-10', 'Attending', 'Attended'),
(54, 5, 15, '2024-10-03', 'Maybe', 'Did not attend'),
(55, 6, 17, '2024-11-10', 'Attending', 'Attended'),
(56, 6, 18, '2024-12-20', 'Attending', 'Attended'),
(57, 7, 19, '2025-01-15', 'Maybe', 'Did not attend'),
(58, 8, 21, '2025-02-22', 'Attending', 'Attended'),
(59, 9, 23, '2025-03-14', 'Attending', 'Attended'),
(60, 10, 24, '2025-04-08', 'Maybe', 'Did not attend'),
(61, 10, 25, '2025-05-28', 'Attending', 'Attended'),
(62, 11, 26, '2025-06-05', 'Attending', 'Attended'),
(63, 12, 27, '2025-07-20', 'Maybe', 'Did not attend'),
(64, 12, 28, '2025-08-15', 'Attending', 'Attended'),
(65, 13, 29, '2025-09-03', 'Maybe', 'Did not attend'),
(66, 14, 30, '2025-10-22', 'Attending', 'Attended'),
(67, 15, 1, '2025-11-12', 'Attending', 'Attended'),
(68, 15, 2, '2025-12-14', 'Maybe', 'Did not attend'),
(69, 1, 5, '2025-01-10', 'Attending', 'Attended'),
(70, 2, 6, '2025-02-15', 'Maybe', 'Did not attend'),
(71, 10, 71, '2024-09-15', 'Attending', 'Attended'),
(72, 10, 38, '2024-10-20', 'Attending', 'Attended'),
(73, 10, 56, '2024-11-18', 'Attending', 'Attended'),
(74, 10, 59, '2024-12-22', 'Attending', 'Attended'),
(75, 10, 61, '2025-01-25', 'Attending', 'Attended'),
(76, 7, 72, '2024-09-10', 'Attending', 'Attended'),
(77, 7, 46, '2024-11-30', 'Attending', 'Attended'),
(78, 7, 48, '2025-02-15', 'Attending', 'Attended'),
(79, 7, 52, '2025-03-20', 'Attending', 'Attended'),
(80, 13, 73, '2024-10-15', 'Attending', 'Attended'),
(81, 13, 50, '2024-12-30', 'Attending', 'Attended'),
(82, 13, 40, '2025-01-10', 'Attending', 'Attended'),
(83, 13, 47, '2025-03-25', 'Attending', 'Attended'),
(84, 2, 74, '2024-09-25', 'Attending', 'Attended'),
(85, 2, 54, '2024-11-25', 'Attending', 'Attended'),
(86, 4, 75, '2024-09-05', 'Attending', 'Attended');
 
-- Sample Data for Reviews
INSERT INTO Reviews (review_ID, review_text, reviewRating, nb_likes, rsvpid) VALUES
(1, 'Great workshop! Learned a lot and met interesting people.', 5, 10, 1),
(2, 'Interesting pitch session, but could use more real-world examples.', 4, 11, 2),
(3, 'Loved the cleanup initiative, very fulfilling and well organized.', 5, 20, 3),
(4, 'Beautiful poetry evening, though a bit too long for my taste.', 4, 4, 4),
(5, 'Relaxing yoga session, the instructor was excellent.', 5, 12, 5),
(6, 'The e-commerce trends were relevant, but presentation was too fast.', 3, 7, 6),
(7, 'Adventure was amazing! Highly recommend this experience.', 5, 15, 7),
(8, 'The cultural festival was chaotic, could have been better managed.', 2, 3, 8),
(9, 'Well-planned trip, but the hike was too challenging for beginners.', 4, 14, 9),
(10, 'Nature photography walk was informative and inspiring.', 5, 18, 10),
(11, 'Urban photo shoot was okay, nothing particularly exciting.', 3, 2, 11),
(12, 'Gourmet cooking class was fun, but the recipes were too simple.', 4, 9, 12),
(13, 'Baking workshop was delightful, learned a lot of new techniques.', 5, 11, 13),
(14, 'Vegan cooking demo was rushed, but the food was delicious.', 4, 6, 14),
(15, 'BBQ competition was thrilling, but too crowded for my liking.', 3, 13, 15),
(16, 'App development bootcamp was challenging but very rewarding.', 5, 17, 16),
(17, 'Web design sprint was informative, but the pace was too fast.', 3, 4, 17),
(18, 'Financial analysis workshop was useful, but could use more examples.', 4, 8, 18),
(19, 'Real estate seminar was insightful and covered a lot of ground.', 5, 12, 19),
(20, 'Luxury travel planning was excellent, learned many new tips.', 5, 16, 20),
(21, 'Eco-tourism summit was eye-opening, but a bit disorganized.', 3, 5, 21),
(22, 'Portrait photography session was too technical, not for beginners.', 2, 3, 22),
(23, 'Street photography walk was inspiring, loved the urban environment.', 5, 19, 23),
(24, 'Seafood cooking class was fun, but the portions were too small.', 4, 10, 24),
(25, 'Pasta making workshop was delightful, would definitely recommend.', 5, 14, 25),
(26, 'Dessert masterclass was too basic, expected more advanced techniques.', 3, 2, 26),
(27, 'AI research symposium was groundbreaking, learned a lot.', 5, 20, 27),
(28, 'Startup mentorship session was helpful, but could be more interactive.', 4, 7, 28),
(29, 'Digital nomad meetup was interesting, but too short.', 4, 11, 29),
(30, 'Film photography workshop was unique and educational.', 5, 18, 30),
(31, 'The pitch event was informative but lacked practical examples.', 3, 5, 31),
(32, 'Cybersecurity training was excellent, highly recommended.', 5, 20, 32),
(33, 'Cooking class was fun, but the kitchen was too small.', 3, 7, 33),
(34, 'Photography session was inspiring, loved the outdoor setting.', 5, 15, 34),
(35, 'E-commerce trends session was useful but too fast-paced.', 3, 6, 35),
(36, 'Yoga session was relaxing, but the room was too crowded.', 4, 12, 36),
(37, 'The app development bootcamp was intense but very rewarding.', 5, 19, 37),
(38, 'Startup pitch event was great, learned a lot about pitching.', 4, 8, 38),
(39, 'Blockchain seminar was informative but could be more detailed.', 3, 10, 39),
(40, 'Backpacking trip was tough but rewarding, amazing views.', 5, 14, 40),
(41, 'Marketing strategies session was useful but lacked engagement.', 3, 5, 41),
(42, 'Cultural festival was vibrant, but the schedule was too tight.', 4, 13, 42),
(43, 'Poetry evening was beautiful, a perfect way to end the week.', 5, 16, 43),
(44, 'Street photography was fun, but the weather wasn’t great.', 4, 6, 44),
(45, 'Nature walk was relaxing, but could have been longer.', 4, 8, 45),
(46, 'Informative AI Workshop, gained valuable insights.', 5, 15, 71),
(47, 'Loved the advanced blockchain seminar, very detailed.', 5, 18, 72),
(48, 'Cybersecurity training was intense but rewarding.', 5, 20, 73),
(49, 'Great competition, very engaging.', 5, 12, 74),
(50, 'Marketing strategies were spot on, very useful.', 5, 10, 75),
(51, 'Leadership summit was inspiring, highly recommend.', 5, 16, 76),
(52, 'Cultural awareness workshop was eye-opening.', 5, 14, 77),
(53, 'Amazing photography techniques, learned a lot.', 5, 19, 78),
(54, 'Excellent session on advanced photography.', 5, 17, 79),
(55, 'Great AI insights from this workshop.', 5, 18, 80),
(56, 'Blockchain seminar was top-notch.', 5, 20, 81),
(57, 'Incredible cybersecurity training.', 5, 15, 82),
(58, 'Fantastic pitch event.', 5, 11, 83),
(59, 'Highly informative marketing session.', 5, 12, 84),
(60, 'Leadership summit was outstanding.', 5, 14, 85),
(61, 'Excellent cultural awareness workshop.', 5, 13, 86);
 
-- Sample Data for Membership
INSERT INTO Membership (membershipID, membershipLevel, groupid, studentid) VALUES
(1, 'Creator', 1, 1),
(2, 'Admin', 1, 2),
(3, 'Admin', 1, 3),
(4, 'Basic', 1, 4),
(5, 'Basic', 1, 5),
(6, 'Basic', 1, 6),
(7, 'Basic', 1, 7),
(8, 'Basic', 1, 8),
(9, 'Basic', 1, 9),
(10, 'Basic', 1, 10),
(11, 'Basic', 1, 11),
(12, 'Basic', 1, 12),
(13, 'Basic', 1, 13),
(14, 'Basic', 1, 14),
(15, 'Basic', 1, 15),
(16, 'Creator', 2, 16),
(17, 'Admin', 2, 17),
(18, 'Admin', 2, 18),
(19, 'Basic', 2, 19),
(20, 'Basic', 2, 20),
(21, 'Basic', 2, 21),
(22, 'Basic', 2, 22),
(23, 'Basic', 2, 23),
(24, 'Basic', 2, 24),
(25, 'Basic', 2, 25),
(26, 'Basic', 2, 26),
(27, 'Basic', 2, 27),
(28, 'Basic', 2, 28),
(29, 'Basic', 2, 29),
(30, 'Basic', 2, 30),
(31, 'Creator', 3, 1),
(32, 'Admin', 3, 2),
(33, 'Admin', 3, 3),
(34, 'Basic', 3, 4),
(35, 'Basic', 3, 5),
(36, 'Basic', 3, 6),
(37, 'Basic', 3, 7),
(38, 'Basic', 3, 8),
(39, 'Basic', 3, 9),
(40, 'Basic', 3, 10),
(41, 'Basic', 3, 11),
(42, 'Basic', 3, 12),
(43, 'Basic', 3, 13),
(44, 'Basic', 3, 14),
(45, 'Basic', 3, 15),
(46, 'Creator', 4, 16),
(47, 'Admin', 4, 17),
(48, 'Admin', 4, 18),
(49, 'Basic', 4, 19),
(50, 'Basic', 4, 20),
(51, 'Creator', 5, 21),
(52, 'Admin', 5, 22),
(53, 'Admin', 5, 23),
(54, 'Basic', 5, 24),
(55, 'Basic', 5, 25),
(56, 'Creator', 6, 26),
(57, 'Admin', 6, 27),
(58, 'Admin', 6, 28),
(59, 'Basic', 6, 29),
(60, 'Basic', 6, 30),
(61, 'Creator', 7, 1),
(62, 'Admin', 7, 2),
(63, 'Admin', 7, 3),
(64, 'Basic', 7, 4),
(65, 'Basic', 7, 5),
(66, 'Creator', 8, 6),
(67, 'Admin', 8, 7),
(68, 'Admin', 8, 8),
(69, 'Basic', 8, 9),
(70, 'Basic', 8, 10),
(71, 'Creator', 9, 11),
(72, 'Admin', 9, 12),
(73, 'Admin', 9, 13),
(74, 'Basic', 9, 14),
(75, 'Creator', 10, 15),
(76, 'Admin', 10, 16),
(77, 'Admin', 10, 17),
(78, 'Basic', 10, 18),
(79, 'Basic', 10, 19),
(80, 'Creator', 11, 20),
(81, 'Admin', 11, 21),
(82, 'Admin', 11, 22),
(83, 'Basic', 11, 23),
(84, 'Basic', 11, 24),
(85, 'Creator', 12, 25),
(86, 'Admin', 12, 26),
(87, 'Admin', 12, 27),
(88, 'Basic', 12, 28),
(89, 'Basic', 12, 29),
(90, 'Creator', 13, 30),
(91, 'Admin', 13, 1),
(92, 'Admin', 13, 2),
(93, 'Basic', 13, 3),
(94, 'Creator', 14, 4),
(95, 'Admin', 14, 5),
(96, 'Admin', 14, 6),
(97, 'Basic', 14, 7),
(98, 'Basic', 14, 8),
(99, 'Creator', 15, 9),
(100, 'Admin', 15, 10),
(101, 'Admin', 15, 11),
(102, 'Basic', 15, 12),
(103, 'Creator', 16, 13),
(104, 'Admin', 16, 14),
(105, 'Admin', 16, 15),
(106, 'Basic', 16, 16),
(107, 'Basic', 16, 17),
(108, 'Creator', 17, 18),
(109, 'Admin', 17, 19),
(110, 'Admin', 17, 20),
(111, 'Basic', 17, 21),
(112, 'Basic', 17, 22),
(113, 'Creator', 18, 23),
(114, 'Admin', 18, 24),
(115, 'Admin', 18, 25),
(116, 'Basic', 18, 26),
(117, 'Basic', 18, 27),
(118, 'Creator', 19, 28),
(119, 'Admin', 19, 29),
(120, 'Admin', 19, 30),
(121, 'Basic', 19, 1),
(122, 'Basic', 19, 2),
(123, 'Creator', 20, 3),
(124, 'Admin', 20, 4),
(125, 'Admin', 20, 5),
(126, 'Basic', 20, 6),
(127, 'Basic', 20, 7),
(128, 'Creator', 21, 8),
(129, 'Admin', 21, 9),
(130, 'Admin', 21, 10),
(131, 'Basic', 21, 11),
(132, 'Basic', 21, 12),
(133, 'Creator', 22, 13),
(134, 'Admin', 22, 14),
(135, 'Admin', 22, 15),
(136, 'Basic', 22, 16),
(137, 'Basic', 22, 17),
(138, 'Creator', 23, 18),
(139, 'Admin', 23, 19),
(140, 'Admin', 23, 20),
(141, 'Basic', 23, 21),
(142, 'Basic', 23, 22),
(143, 'Creator', 24, 23),
(144, 'Admin', 24, 24),
(145, 'Admin', 24, 25),
(146, 'Basic', 24, 26),
(147, 'Basic', 24, 27),
(148, 'Creator', 25, 28),
(149, 'Admin', 25, 29),
(150, 'Admin', 25, 30),
(151, 'Basic', 25, 1),
(152, 'Basic', 25, 2),
(153, 'Creator', 26, 3),
(154, 'Admin', 26, 4),
(155, 'Admin', 26, 5),
(156, 'Basic', 26, 6),
(157, 'Basic', 26, 7),
(158, 'Creator', 27, 8),
(159, 'Admin', 27, 9),
(160, 'Admin', 27, 10),
(161, 'Basic', 27, 11),
(162, 'Basic', 27, 12),
(163, 'Creator', 28, 13),
(164, 'Admin', 28, 14),
(165, 'Admin', 28, 15),
(166, 'Basic', 28, 16),
(167, 'Basic', 28, 17),
(168, 'Creator', 29, 18),
(169, 'Admin', 29, 19),
(170, 'Admin', 29, 20),
(171, 'Basic', 29, 21),
(172, 'Basic', 29, 22),
(173, 'Creator', 30, 23),
(174, 'Admin', 30, 24),
(175, 'Admin', 30, 25),
(176, 'Basic', 30, 26),
(177, 'Basic', 30, 27),
(178, 'Basic', 30, 28);