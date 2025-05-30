# 📘 LMS Database Documentation

This document outlines the LMS (Learning Management System) database schema and provides a complete set of functional queries. The LMS system supports candidate tracking, technology assignments, mentor mapping, lab coordination, and deployment.

---

## 📁 Project Overview

The Learning Management System is designed to streamline the training and hiring pipeline for fellowship candidates. It tracks attendance, mentor guidance, technology stacks, document submissions, and company hiring needs.

---

## 🗂️ Database Tables & Descriptions

| Table Name                    | Purpose                                                              |
|------------------------------|----------------------------------------------------------------------|
| **User_Details**             | Stores general user login/authentication info.                      |
| **Hired_Candidate**          | Tracks candidates already hired and onboarded.                      |
| **Fellowship_Candidate**     | Stores active candidate details and life cycle.                     |
| **Candidate_Bank_Details**   | Stores candidate banking information for stipends/payouts.          |
| **CandidateQualification**   | Contains educational background of candidates.                      |
| **CandidateDocuments**       | Tracks submission status of required candidate documents.           |
| **TechStack**                | Lists available technologies (e.g., Java, Python).                  |
| **TechType**                 | Classifies types of tech (e.g., Backend, Frontend).                 |
| **MakerProgram**             | Information about the learning or training program itself.          |
| **Lab**                      | Lab details such as location (e.g., Mumbai, Bangalore, Pune).       |
| **Mentor**                   | Stores mentor data (both buddy and ideation mentors).               |
| **MentorIdeationMap**        | Maps ideation mentors to candidates.                                |
| **MentorTechStack**          | Maps mentors to the technologies they specialize in.                |
| **Company**                  | Details of companies hiring from the LMS.                           |
| **CompanyRequirement**       | Specific role requirements from companies.                          |
| **CandidateStackAssignment** | Records which technology stack is assigned to which candidate.      |
| **Attendance**               | Tracks daily check-in/check-out times for each candidate.           |
| **AppParameters**            | Stores global system configurations.                               |
| **LabThreshold**             | Time thresholds for late/early attendance detection.                |

---

## Queries

1. Find all candidates having Java technology
2. Find all mentors and ideations with Java technology
3. Find all candidates present today
4. Find all candidates who came late today
5. Find all candidates who went early yesterday
6. Find all candidates who came early today
7. Find candidates who haven't been assigned a technology
8. Find candidates who haven't submitted documents
9. Find candidates who haven't submitted bank details
10. Find candidates who joined in December
11. Find candidates whose course ends in February
12. Find course end date for candidates who joined on 22-02-2019
13. Find candidates who passed out in 2019
14. Find technology assigned to candidates with MCA background
15. Find number of candidates who joined last month
16. Find number of weeks completed in BridgeLabz by candidate ID = 2
17. Find joining date of candidate ID = 4
18. Find remaining weeks for candidate ID = 5
19. Find remaining days for candidate ID = 6
20. Find candidates who are deployed
21. Find candidate details along with assigned company
22. Find all candidates and mentors related to labs in Bangalore, Mumbai, or Pune
23. Find buddy/ideation mentor and assigned technology for candidate ID = 6