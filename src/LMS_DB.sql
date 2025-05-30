CREATE DATABASE LMS_DB;
use LMS_DB;

-- 1. User_Details
CREATE TABLE User_Details (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    Password VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15),
    verified BOOLEAN DEFAULT FALSE,
    creator_stamp DATETIME,
    creator_user INT
);

-- 2. Hired_Candidate
CREATE TABLE Hired_Candidate (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    EmailId VARCHAR(100),
    Hired_City VARCHAR(100),
    Degree VARCHAR(100),
    Hired_Date DATE,
    Mobile_Number VARCHAR(15),
    Permanent_Pincode VARCHAR(10),
    Hired_Lab VARCHAR(100),
    Attitude TEXT,
    Communication_Remark TEXT,
    Knowledge_Remark TEXT,
    Aggregate_Remark TEXT,
    Status ENUM('Pending', 'Accepted', 'Rejected'),
    Creator_Stamp DATETIME,
    Creator_User INT
);

-- 3. Fellowship_Candidate
CREATE TABLE Fellowship_Candidate (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CIC_ID VARCHAR(30),
    First_Name VARCHAR(50),
    Middle_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    EmailId VARCHAR(100),
    Hired_City VARCHAR(100),
    Degree VARCHAR(100),
    Hired_Date DATE,
    Mobile_Number VARCHAR(15),
    Permanent_Pincode VARCHAR(10),
    Hired_Lab VARCHAR(100),
    Attitude TEXT,
    Communication_Remark TEXT,
    Knowledge_Remark TEXT,
    Aggregate_Remark TEXT,
    Creator_Stamp DATETIME,
    Creator_User INT,
    Birth_Date DATE,
    Is_Birth_Date_Verified BOOLEAN,
    Parent_Name VARCHAR(100),
    Parent_Occupation VARCHAR(100),
    Parents_Mobile_Number VARCHAR(15),
    Parents_Annual_Salary DECIMAL(10,2),
    Local_Address TEXT,
    Permanent_Address TEXT,
    Photo_Path VARCHAR(255),
    Joining_Date DATE,
    Candidate_Status VARCHAR(50),
    Personal_Information TEXT,
    Bank_Information TEXT,
    Educational_Information TEXT,
    Document_Status VARCHAR(100),
    Remark TEXT
);

-- 4. Candidate_Bank_Details
CREATE TABLE Candidate_Bank_Details (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_Id INT,
    Name VARCHAR(100),
    Account_Number VARCHAR(30),
    Is_Account_Num_Verified BOOLEAN,
    Ifsc_code VARCHAR(20),
    is_ifsc_code_verified BOOLEAN,
    pan_number VARCHAR(20),
    is_pan_number_verified BOOLEAN,
    addhaar_num VARCHAR(20),
    is_addhaar_num_verified BOOLEAN,
    creator_stamp DATETIME,
    creator_user INT,
    FOREIGN KEY (candidate_Id) REFERENCES Fellowship_Candidate(Id)
);

-- 5. CandidateQualification
CREATE TABLE CandidateQualification (
    id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id INT,
    diploma VARCHAR(255),
    degree_name VARCHAR(255),
    is_degree_name_verified BOOLEAN,
    employee_decipline VARCHAR(255),
    is_employee_decipline_verified BOOLEAN,
    passing_year INT,
    is_passing_year_verified BOOLEAN,
    aggr_per DECIMAL(5,2),
    final_year_per DECIMAL(5,2),
    is_final_year_per_verified BOOLEAN,
    training_institute VARCHAR(255),
    is_training_institute_verified BOOLEAN,
    training_duration_month INT,
    is_training_duration_month_verified BOOLEAN,
    other_training VARCHAR(255),
    is_other_training_verified BOOLEAN,
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (candidate_id) REFERENCES Fellowship_Candidate(Id)
);

-- 6. CandidateDocuments
CREATE TABLE CandidateDocuments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    candidate_id INT,
    doc_type VARCHAR(100),
    doc_path TEXT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (candidate_id) REFERENCES Fellowship_Candidate(Id)
);

-- 7. Company
CREATE TABLE Company (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    address TEXT,
    location VARCHAR(100),
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255)
);

-- 8. MakerProgram
CREATE TABLE MakerProgram (
    id INT PRIMARY KEY AUTO_INCREMENT,
    program_name VARCHAR(255),
    program_type VARCHAR(255),
    program_link TEXT,
    tech_stack_id INT,
    tech_type_id INT,
    is_program_approved BOOLEAN,
    description TEXT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (tech_stack_id) REFERENCES TechStack(id),
    FOREIGN KEY (tech_type_id) REFERENCES TechType(id)
);

-- 9. AppParameters
CREATE TABLE AppParameters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    key_type VARCHAR(100),
    key_value VARCHAR(100),
    key_text VARCHAR(255),
    cur_status VARCHAR(50),
    lastupd_user VARCHAR(100),
    lastupd_stamp TIMESTAMP,
    creator_user VARCHAR(100),
    creator_stamp TIMESTAMP,
    seq_num INT
);

-- 10. Mentor
CREATE TABLE Mentor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    mentor_type VARCHAR(100),
    lab_id INT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (lab_id) REFERENCES Lab(id)
);

-- 11. MentorIdeationMap
CREATE TABLE MentorIdeationMap (
    id INT PRIMARY KEY AUTO_INCREMENT,
    parent_mentor_id INT,
    mentor_id INT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (parent_mentor_id) REFERENCES Mentor(id),
    FOREIGN KEY (mentor_id) REFERENCES Mentor(id)
);

-- 12. MentorTechStack
CREATE TABLE MentorTechStack (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_id INT,
    tech_stack_id INT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    datetime TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (mentor_id) REFERENCES Mentor(id),
    FOREIGN KEY (tech_stack_id) REFERENCES TechStack(id)
);

-- 13. TechStack
CREATE TABLE TechStack (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tech_name VARCHAR(100),
    image_path TEXT,
    framework VARCHAR(255),
    cur_status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255)
);

-- 14. TechType
CREATE TABLE TechType (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100),
    cur_status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255)
);

-- 15. Lab
CREATE TABLE Lab (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(100),
    address TEXT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255)
);

-- 16. LabThreshold
CREATE TABLE LabThreshold (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lab_id INT,
    lab_capacity INT,
    lead_threshold INT,
    ideation_engg_threshold INT,
    buddy_engg_threshold INT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (lab_id) REFERENCES Lab(id)
);

-- 17. CompanyRequirement
CREATE TABLE CompanyRequirement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    requested_month VARCHAR(50),
    city VARCHAR(100),
    is_doc_verification BOOLEAN,
    requirement_doc_path TEXT,
    no_of_engg INT,
    tech_stack_id INT,
    tech_type_id INT,
    maker_program_id INT,
    lead_id INT,
    ideation_engg_id INT,
    buddy_engg_id INT,
    special_remark TEXT,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES Company(id),
    FOREIGN KEY (tech_stack_id) REFERENCES TechStack(id),
    FOREIGN KEY (tech_type_id) REFERENCES TechType(id),
    FOREIGN KEY (maker_program_id) REFERENCES MakerProgram(id),
    FOREIGN KEY (lead_id) REFERENCES Mentor(id),
    FOREIGN KEY (ideation_engg_id) REFERENCES Mentor(id),
    FOREIGN KEY (buddy_engg_id) REFERENCES Mentor(id)
);

-- 18. CandidateStackAssignment
CREATE TABLE CandidateStackAssignment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    requirement_id INT,
    candidate_id INT,
    assign_date DATE,
    complete_date DATE,
    status VARCHAR(50),
    creator_stamp TIMESTAMP,
    creator_user VARCHAR(255),
    FOREIGN KEY (requirement_id) REFERENCES CompanyRequirement(id),
    FOREIGN KEY (candidate_id) REFERENCES Fellowship_Candidate(Id)
);

-- 19. attendence
CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    date DATE,
    status VARCHAR(20)
);


-- 1. Insert Users
INSERT INTO User_Details (email, first_name, last_name, Password, contact_number, verified, creator_stamp, creator_user) VALUES
('likhitha@gmail.com', 'Likhitha', 'Pulluru', 'pass123', '9999990001', TRUE, NOW(), 1),
('manasa@gmail.com', 'Manasa', 'S', 'pass123', '9999990002', TRUE, NOW(), 1),
('chaitanya@gmail.com', 'Chaitanya', 'V', 'pass123', '9999990003', TRUE, NOW(), 1),
('vyshnavi@gmail.com', 'Vyshnavi', 'K', 'pass123', '9999990004', TRUE, NOW(), 1);

-- 2. Insert Labs
INSERT INTO Lab (id, name, location, address, status, creator_stamp, creator_user) VALUES
(1, 'Lab Bangalore', 'Bangalore', 'Bangalore Address', 'Active', NOW(), 1),
(2, 'Lab Mumbai', 'Mumbai', 'Mumbai Address', 'Active', NOW(), 1),
(3, 'Lab Pune', 'Pune', 'Pune Address', 'Active', NOW(), 1);

-- 3. Insert TechStacks
INSERT INTO TechStack (id, tech_name, image_path, framework, cur_status, creator_stamp, creator_user) VALUES
(1, 'Java', '', 'Spring', 'Active', NOW(), 1),
(2, 'Python', '', 'Django', 'Active', NOW(), 1),
(3, 'React', '', 'ReactJS', 'Active', NOW(), 1);

-- 4. Insert TechType
INSERT INTO TechType (id, type_name, cur_status, creator_stamp, creator_user) VALUES
(1, 'Backend', 'Active', NOW(), 1),
(2, 'Frontend', 'Active', NOW(), 1);

-- 5. Insert Fellowship Candidates
INSERT INTO Fellowship_Candidate (Id, CIC_ID, First_Name, Last_Name, EmailId, Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode, Hired_Lab, Birth_Date, Is_Birth_Date_Verified, Joining_Date, Candidate_Status, creator_stamp, Creator_User) VALUES
(1, 'CIC2024-001', 'Likhitha', 'Pulluru', 'likhitha@gmail.com', 'Hyderabad', 'MCA', '2025-01-10', '9999990001', '500001', 'Lab Bangalore', '1999-05-01', TRUE, '2025-02-22', 'Deployed', NOW(), 1),
(2, 'CIC2024-002', 'Manasa', 'S', 'manasa@gmail.com', 'Chennai', 'MCA', '2025-02-15', '9999990002', '600001', 'Lab Mumbai', '1998-04-10', TRUE, '2025-03-01', 'Active', NOW(), 1),
(3, 'CIC2024-003', 'Chaitanya', 'V', 'chaitanya@gmail.com', 'Warangal', 'B.Tech', '2025-02-20', '9999990003', '506002', 'Lab Pune', '2000-03-15', TRUE, '2025-04-01', 'Active', NOW(), 1),
(4, 'CIC2024-004', 'Vyshnavi', 'K', 'vyshnavi@gmail.com', 'Vijayawada', 'MCA', '2025-03-01', '9999990004', '520001', 'Lab Bangalore', '1997-06-25', TRUE, '2025-05-01', 'Active', NOW(), 1);
INSERT INTO Fellowship_Candidate (
    CIC_ID, First_Name, Middle_Name, Last_Name, EmailId,
    Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode,
    Hired_Lab, Attitude, Communication_Remark, Knowledge_Remark, Aggregate_Remark,
    Creator_Stamp, Creator_User, Birth_Date, Is_Birth_Date_Verified, Parent_Name,
    Parent_Occupation, Parents_Mobile_Number, Parents_Annual_Salary, Local_Address,
    Permanent_Address, Photo_Path, Joining_Date, Candidate_Status,
    Personal_Information, Bank_Information, Educational_Information,
    Document_Status, Remark
) VALUES (
    'CIC2024-005', 'Aarav', NULL, 'Sharma', 'aarav.sharma@example.com',
    'Delhi', 'B.Tech', '2025-04-10', '9876543210', '110001',
    'Lab Delhi', 'Positive', 'Clear speaker', 'Good technical base', 'Above average',
    NOW(), 1, '2000-08-15', TRUE, 'Ramesh Sharma',
    'Teacher', '9988776655', 450000.00, '101, Nehru Nagar, Delhi',
    '501, Rajpath, Delhi', '/images/aarav.jpg', '2025-12-01', 'Active',
    'Personal info complete', 'Account with SBI', 'Bachelor degree uploaded',
    'Verified', 'No remarks'
);
INSERT INTO Fellowship_Candidate (
    CIC_ID, First_Name, Last_Name, EmailId,
    Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode,
    Hired_Lab, Birth_Date, Is_Birth_Date_Verified, Joining_Date,
    Candidate_Status, creator_stamp, Creator_User
) VALUES (
    'CIC2024-006', 'Rahul', 'Verma', 'rahul.verma@example.com',
    'Kolkata', 'B.Sc', '2024-10-15', '9876501234', '700001',
    'Lab Mumbai', '1999-10-05', TRUE, '2024-11-30',
    'Active', NOW(), 1
);
INSERT INTO Fellowship_Candidate (
    Id, CIC_ID, First_Name, Middle_Name, Last_Name, EmailId,
    Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode,
    Hired_Lab, Attitude, Communication_Remark, Knowledge_Remark, Aggregate_Remark,
    Creator_Stamp, Creator_User, Birth_Date, Is_Birth_Date_Verified, Parent_Name,
    Parent_Occupation, Parents_Mobile_Number, Parents_Annual_Salary, Local_Address,
    Permanent_Address, Photo_Path, Joining_Date, Candidate_Status,
    Personal_Information, Bank_Information, Educational_Information,
    Document_Status, Remark
) VALUES
(
    5, 'CIC2024-005', 'Aarav', NULL, 'Sharma', 'aarav.sharma@example.com',
    'Delhi', 'B.Tech', '2025-04-10', '9876543210', '110001',
    'Lab Delhi', 'Positive', 'Clear speaker', 'Good technical base', 'Above average',
    NOW(), 1, '2000-08-15', TRUE, 'Ramesh Sharma',
    'Teacher', '9988776655', 450000.00, '101, Nehru Nagar, Delhi',
    '501, Rajpath, Delhi', '/images/aarav.jpg', '2025-03-01', 'Active',
    'Personal info complete', 'Account with SBI', 'Bachelor degree uploaded',
    'Verified', 'No remarks'
);
INSERT INTO Fellowship_Candidate (
    CIC_ID, First_Name, Last_Name, EmailId,
    Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode,
    Hired_Lab, Birth_Date, Is_Birth_Date_Verified, Joining_Date,
    Candidate_Status, creator_stamp, Creator_User
) VALUES (
    'CIC2024-006', 'Rahul', 'Verma', 'rahul.verma@example.com',
    'Kolkata', 'B.Sc', '2024-10-15', '9876501234', '700001',
    'Lab Mumbai', '1999-10-05', TRUE, '2024-11-30',
    'Active', NOW(), 1
);

-- 6. Insert Candidate Qualification
INSERT INTO CandidateQualification (id, candidate_id, degree_name, is_degree_name_verified, passing_year, is_passing_year_verified, aggr_per, final_year_per, is_final_year_per_verified, creator_stamp, creator_user) VALUES
(1, 1, 'MCA', TRUE, 2019, TRUE, 78.5, 80.0, TRUE, NOW(), 'admin'),
(2, 2, 'MCA', TRUE, 2020, TRUE, 80.0, 82.0, TRUE, NOW(), 'admin'),
(3, 3, 'B.Tech', TRUE, 2021, TRUE, 75.0, 77.5, TRUE, NOW(), 'admin'),
(4, 4, 'MCA', TRUE, 2019, TRUE, 85.0, 87.0, TRUE, NOW(), 'admin');

-- 7. Insert Candidate Bank Details (leave Vyshnavi without bank details)
INSERT INTO Candidate_Bank_Details (candidate_Id, Name, Account_Number, Is_Account_Num_Verified, Ifsc_code, is_ifsc_code_verified, pan_number, is_pan_number_verified, addhaar_num, is_addhaar_num_verified, creator_stamp, creator_user) VALUES
(1, 'Likhitha Pulluru', '1234567890', TRUE, 'IFSC001', TRUE, 'PAN001', TRUE, 'AADHAR001', TRUE, NOW(), 1),
(2, 'Manasa S', '1234567891', TRUE, 'IFSC002', TRUE, 'PAN002', TRUE, 'AADHAR002', TRUE, NOW(), 1),
(3, 'Chaitanya V', '1234567892', TRUE, 'IFSC003', TRUE, 'PAN003', TRUE, 'AADHAR003', TRUE, NOW(), 1);

-- 8. Insert Candidate Documents (leave Chaitanya without documents)
INSERT INTO CandidateDocuments (id, candidate_id, doc_type, doc_path, status, creator_stamp, creator_user) VALUES
(1, 1, 'Resume', '/docs/resume1.pdf', 'Submitted', NOW(), 'admin'),
(2, 2, 'Resume', '/docs/resume2.pdf', 'Submitted', NOW(), 'admin'),
(3, 4, 'Resume', '/docs/resume4.pdf', 'Submitted', NOW(), 'admin');

-- 9. Insert Company
INSERT INTO Company (id, name, address, location, status, creator_stamp, creator_user) VALUES
(1, 'TCS', 'Hyderabad', 'Hyderabad', 'Active', NOW(), 'admin');

-- 10. Insert CompanyRequirement
INSERT INTO CompanyRequirement (id, company_id, requested_month, city, is_doc_verification, no_of_engg, tech_stack_id, tech_type_id, maker_program_id, lead_id, ideation_engg_id, buddy_engg_id, status, creator_stamp, creator_user) VALUES
(1, 1, 'Feb', 'Hyderabad', TRUE, 2, 1, 1, NULL, NULL, NULL, NULL, 'Active', NOW(), 'admin');

-- 11. Insert CandidateStackAssignment (assign Java to candidates 1, 2)
INSERT INTO CandidateStackAssignment (id, requirement_id, candidate_id, assign_date, complete_date, status, creator_stamp, creator_user) VALUES
(1, 1, 1, '2025-02-23', '2025-05-16', 'Completed', NOW(), 'admin'),
(2, 1, 2, '2025-03-02', NULL, 'Ongoing', NOW(), 'admin');

-- 12. Insert Mentor
INSERT INTO Mentor (id, name, mentor_type, lab_id, status, creator_stamp, creator_user) VALUES
(1, 'Ravi', 'Ideation', 1, 'Active', NOW(), 'admin'),
(2, 'Kiran', 'Buddy', 2, 'Active', NOW(), 'admin');

-- 13. Insert MentorTechStack (Java mentor)
INSERT INTO MentorTechStack (id, mentor_id, tech_stack_id, status, creator_stamp, datetime, creator_user) VALUES
(1, 1, 1, 'Active', NOW(), NOW(), 'admin'),
(2, 2, 1, 'Active', NOW(), NOW(), 'admin');

-- 14. Insert MakerProgram
INSERT INTO MakerProgram (id, program_name, program_type, tech_stack_id, tech_type_id, is_program_approved, description, status, creator_stamp, creator_user) VALUES
(1, 'BridgeLabz Bootcamp', 'FullTime', 1, 1, TRUE, 'Java intensive program', 'Active', NOW(), 'admin');

INSERT INTO attendance (id, student_id, date, status) VALUES
(1, 1, '2025-05-29', 'Present'),
(2, 2, '2025-05-29', 'Late'),
(3, 3, '2025-05-29', 'Absent'),
(4, 4, '2025-05-29', 'Present'),
(5, 5, '2025-05-29', 'Early Leave'),
(6, 6, '2025-05-29', 'Present'),
(7, 1, '2025-05-28', 'Present'),
(8, 2, '2025-05-28', 'Present'),
(9, 3, '2025-05-28', 'Absent'),
(10, 4, '2025-05-28', 'Early Leave'),
(11, 5, '2025-05-28', 'Present'),
(12, 6, '2025-05-28', 'Present');

-- 1. Find all candidates having Java technology
SELECT FC.First_Name, FC.Last_Name
FROM Fellowship_Candidate FC
JOIN CandidateStackAssignment CSA ON FC.Id = CSA.candidate_id
JOIN CompanyRequirement CR ON CSA.requirement_id = CR.id
JOIN TechStack TS ON CR.tech_stack_id = TS.id
WHERE TS.tech_name = 'Java';

-- 2. Find all mentors and ideation mentors who have Java technology
SELECT M.name, M.mentor_type
FROM Mentor M
JOIN MentorTechStack MTS ON M.id = MTS.mentor_id
JOIN TechStack TS ON MTS.tech_stack_id = TS.id
WHERE TS.tech_name = 'Java';

-- 3. Find all candidates present today (requires attendance tracking table, not in current schema)
SELECT
    FC.First_Name,
    FC.Last_Name,
    A.date,
    A.status
FROM Fellowship_Candidate AS FC
JOIN attendance AS A ON FC.Id = A.student_id
WHERE A.date = CURRENT_DATE() AND A.status = 'Present';

-- 4. Find all candidates who came late today (requires attendance timestamps)
SELECT
    FC.First_Name,
    FC.Last_Name,
    A.date,
    A.status
FROM Fellowship_Candidate AS FC
JOIN attendance AS A ON FC.Id = A.student_id
WHERE A.date = CURRENT_DATE() AND A.status = 'Late';

-- 5. Find all candidates who went early yesterday (requires attendance timestamps)
SELECT
    FC.First_Name,
    FC.Last_Name,
    A.date,
    A.status
FROM Fellowship_Candidate AS FC
JOIN attendance AS A ON FC.Id = A.student_id
WHERE A.date = CURRENT_DATE() - INTERVAL 1 DAY AND A.status = 'Early Leave';

-- 6. Find all candidates who came early today (requires attendance timestamps)
SELECT
    FC.First_Name,
    FC.Last_Name,
    A.date,
    A.status
FROM Fellowship_Candidate AS FC
JOIN attendance AS A ON FC.Id = A.student_id
WHERE A.date = CURRENT_DATE() AND A.status = 'Early Leave';

-- 7. Find names of candidates who did not get technology assigned
SELECT First_Name, Last_Name
FROM Fellowship_Candidate
WHERE Id NOT IN (SELECT candidate_id FROM CandidateStackAssignment);

-- 8. Find names of candidates who did not submit documents
SELECT FC.First_Name, FC.Last_Name
FROM Fellowship_Candidate FC
LEFT JOIN CandidateDocuments CD ON FC.Id = CD.candidate_id
WHERE CD.id IS NULL;

-- 9. Find names of candidates who did not submit bank details
SELECT FC.First_Name, FC.Last_Name
FROM Fellowship_Candidate FC
LEFT JOIN Candidate_Bank_Details CBD ON FC.Id = CBD.candidate_Id
WHERE CBD.Id IS NULL;


-- 10. Find names of candidates who joined in December
SELECT First_Name, Last_Name
FROM Fellowship_Candidate
WHERE MONTH(Joining_Date) = 12;

-- 11. Find names of candidates whose course ends in February (assuming 90-day course)
SELECT First_Name, Last_Name
FROM Fellowship_Candidate
WHERE MONTH(DATE_ADD(Joining_Date, INTERVAL 90 DAY)) = 2;

-- 12. Find course end date if joining date is '22-02-2019'
SELECT First_Name, Last_Name
FROM Fellowship_Candidate
WHERE DATE_ADD(Joining_Date, INTERVAL 90 DAY) = '2019-05-23';


-- 13. Find all candidates who passed out in 2019
SELECT FC.First_Name, FC.Last_Name
FROM CandidateQualification CQ
JOIN Fellowship_Candidate FC ON FC.Id = CQ.candidate_id
WHERE CQ.passing_year = 2019;

-- 14. Technology assigned to candidates with MCA background
SELECT FC.First_Name, FC.Last_Name, TS.tech_name
FROM Fellowship_Candidate FC
JOIN CandidateQualification CQ ON FC.Id = CQ.candidate_id
JOIN CandidateStackAssignment CSA ON FC.Id = CSA.candidate_id
JOIN CompanyRequirement CR ON CSA.requirement_id = CR.id
JOIN TechStack TS ON CR.tech_stack_id = TS.id
WHERE CQ.degree_name LIKE '%MCA%';

-- 15. How many candidates joined in the last month
SELECT COUNT(*) AS LastMonth_Candidates
FROM Fellowship_Candidate
WHERE Joining_Date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 16. Weeks completed by candidate with id = 2
SELECT TIMESTAMPDIFF(WEEK, Joining_Date, CURDATE()) AS Weeks_Completed
FROM Fellowship_Candidate
WHERE Id = 2;

-- 17. Find joining date of candidate with id = 4
SELECT Joining_Date
FROM Fellowship_Candidate
WHERE Id = 4;

-- 18. Weeks remaining for candidate with id = 5 (assuming 90-day program)
SELECT 13 - TIMESTAMPDIFF(WEEK, Joining_Date, CURDATE()) AS Weeks_Remaining
FROM Fellowship_Candidate
WHERE Id = 5;

INSERT INTO Fellowship_Candidate (
    Id, CIC_ID, First_Name, Last_Name, EmailId,
    Hired_City, Degree, Hired_Date, Mobile_Number, Permanent_Pincode,
    Hired_Lab, Birth_Date, Is_Birth_Date_Verified, Joining_Date,
    Candidate_Status, creator_stamp, Creator_User
) VALUES
(5, 'CIC2024-005', 'Aarav', 'Sharma', 'aarav.sharma@example.com', 'Delhi', 'B.Tech', '2025-04-10', '9876543210', '110001', 'Lab Delhi', '2000-08-15', TRUE, '2025-03-01', 'Active', NOW(), 1),
(6, 'CIC2024-006', 'Sneha', 'Patel', 'sneha.patel@example.com', 'Mumbai', 'MCA', '2025-02-15', '9876543211', '400001', 'Lab Mumbai', '1998-11-20', TRUE, '2025-04-15', 'Active', NOW(), 1);

-- 19. Days remaining for candidate with id = 6 (assuming 90-day program)
SELECT DATEDIFF(DATE_ADD(Joining_Date, INTERVAL 90 DAY), CURDATE()) AS Days_Remaining
FROM Fellowship_Candidate
WHERE Id = 6;

-- 20. Find candidates who are deployed
SELECT First_Name, Last_Name
FROM Fellowship_Candidate
WHERE Candidate_Status = 'Deployed';

-- 21. Find candidate details and company assigned---->not working
SELECT FC.First_Name, FC.Last_Name, FC.EmailId, FC.Mobile_Number, C.name AS Company_Name
FROM Fellowship_Candidate FC
JOIN CandidateStackAssignment CSA ON FC.Id = CSA.candidate_id
JOIN CompanyRequirement CR ON CSA.requirement_id = CR.id
JOIN Company C ON CR.company_id = C.id;

-- 22. Find all candidates and mentors related to labs in Bangalore/Mumbai/Pune

-- Candidates
SELECT FC.First_Name, FC.Last_Name
FROM Fellowship_Candidate FC
JOIN Lab L ON FC.Hired_Lab = L.name
WHERE L.location IN ('Bangalore', 'Mumbai', 'Pune');

-- Mentors
SELECT M.name
FROM Mentor M
JOIN Lab L ON M.lab_id = L.id
WHERE L.location IN ('Bangalore', 'Mumbai', 'Pune');

-- 23. For candidate id = 6, get buddy and ideation mentors and tech stack assigned
SELECT
    LM1.name AS Buddy_Mentor,
    LM2.name AS Ideation_Mentor,
    TS.tech_name
FROM CandidateStackAssignment CSA
JOIN CompanyRequirement CR ON CSA.requirement_id = CR.id
JOIN Mentor LM1 ON CR.buddy_engg_id = LM1.id
JOIN Mentor LM2 ON CR.ideation_engg_id = LM2.id
JOIN TechStack TS ON CR.tech_stack_id = TS.id
WHERE CSA.candidate_id = 6;

-- Buddy and Ideation Mentors for candidate 6
SELECT mentor_type, name
FROM Mentor
WHERE lab_id = (
    SELECT id FROM Lab WHERE name = (
        SELECT Hired_Lab FROM Fellowship_Candidate WHERE Id = 6
    )
)
AND mentor_type IN ('Buddy', 'Ideation');

INSERT INTO CandidateStackAssignment (
    id, requirement_id, candidate_id, assign_date, complete_date, status, creator_stamp, creator_user
) VALUES (
    3, 1, 6, '2025-04-15', NULL, 'Ongoing', NOW(), 'admin'
);

-- Tech Stack assigned to candidate 6
SELECT ts.tech_name, ts.framework
FROM CandidateStackAssignment csa
JOIN CompanyRequirement cr ON csa.requirement_id = cr.id
JOIN TechStack ts ON cr.tech_stack_id = ts.id
WHERE csa.candidate_id = 6;
