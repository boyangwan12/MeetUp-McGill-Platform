# MeetUp-McGill-Platform
A SQL-based project connecting McGill students and alumni through shared interests.

## Overview

This project is a SQL-based initiative designed to create a relational database for a platform inspired by [Meetup.com](https://www.meetup.com/). The platform connects McGill University students and alumni through shared interests, enabling group creation, event management, and user engagement tracking. The SQL implementation ensures efficient data management and query capabilities for robust reporting and insights.

## Background Story

McGill University, renowned for its global diversity, sought a solution to foster deeper connections among its students and alumni. With representatives from over 150 countries, McGill identified an opportunity to enhance its community's engagement through a digital platform similar to Meetup. The goal was to create a user-friendly system enabling students and alumni to connect over shared hobbies, professional interests, and educational backgrounds, ultimately strengthening McGill’s global network. This project bridges geographical boundaries to foster a sense of belonging, mentorship, and professional growth.

## Features

- **User Profiles**: Store detailed information about students and alumni, such as academic programs, hobbies, and languages.
- **Group Management**: Support for creating and managing interest-based groups with roles like Creator, Admin, and Basic Member.
- **Event Management**: Schedule, RSVP, and track attendance for activities hosted by groups.
- **Reviews and Feedback**: Users can leave ratings and feedback for activities, promoting continuous improvement.
- **Reports and Analytics**: SQL queries generate insights on user engagement, group activity, and event feedback.

## Functionalities and Business Rules

- Students must create unique profiles to participate in groups and activities.
- Groups are categorized and allow for interest-based user participation.
- Activities track attendance, RSVPs, and reviews for reporting.
- Engagement metrics identify active users and the success of groups and activities.

## Relational Schema

- **Student**: `(studentid, name, email, program, hobbies, languages, graduationyear, country)`
- **Group**: `(groupid, category, groupname, nb_members, area)`
- **Activity**: `(activityid, activityname, duration, starttime, location, capacity, groupid, studentid)`
- **RSVP**: `(rsvpid, studentid, activityid, rsvp_month, rsvp_status, post_event_attendence)`
- **Reviews**: `(review_ID, review_text, reviewRating, nb_likes, rsvpid)`
- **Membership**: `(membershipID, membershipLevel, groupid, studentid)`

## Business Insights and Implications

The MeetUp McGill platform provides several critical business values:

- **Community Engagement**: Strengthens McGill’s brand by fostering a vibrant, engaged community of students and alumni.
- **Event Insights**: Helps organizers identify popular events and underbooked activities, allowing for better resource allocation and targeted promotion.
- **Mentorship Opportunities**: Connects current students with alumni, enabling career networking and knowledge-sharing opportunities.
- **Global Network Utilization**: Capitalizes on McGill’s international diversity to create a global platform for collaboration and community building.
- **Feedback-Driven Improvements**: Leverages user reviews and analytics to refine event offerings and group management processes.

By aligning with McGill University’s mission to connect and engage its diverse community, the platform positions itself as a valuable tool for strengthening ties and providing actionable insights for future initiatives.

## Future Work

- Incorporate additional predictors such as social media engagement and sequel/remake indicators.
- Experiment with machine learning models like Random Forests or Gradient Boosting to enhance predictive power.
- Address data limitations such as inflation adjustments for budget and better categorization of directors/producers.

## Acknowledgments

This project was completed as part of the INSY 661-075: Data & Distributed Systems for Analytics course during Summer 2024 at McGill University, under the guidance of Professor Animesh Animesh and TA Jared Arvind. This project is in collaboration with Karen Bou Daou, Samarth Bavararaj Annigeri, Rajiha Mehdi and Henry Tang.
