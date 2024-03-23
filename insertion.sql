INSERT INTO login (Name, Email, Password, Accounttype) VALUES
('John Doe', 'johndoe@example.com', 'password123', 'investor'),
('Jane Smith', 'janesmith@example.com', 'password123', 'startup'),
('Michael Brown', 'michaelbrown@example.com', 'password123', 'investor'),
('Lisa White', 'lisawhite@example.com', 'password123', 'startup'),
('Alex Green', 'alexgreen@example.com', 'password123', 'investor');

INSERT INTO investor_portfolio (investor_id, Agriculture, Manufacturing, InformationTechnology, Pharmaceuticals, Automobile, FinancialServices, Infrastructure, TourismHospitality, EducationTraining, RetailEcommerce, anyother) VALUES
(1, 10.0, 20.0, 30.0, 0.0, 10.0, 20.0, 5.0, 0.0, 5.0, 0.0, 0.0),
(3, 5.0, 15.0, 25.0, 5.0, 15.0, 25.0, 0.0, 5.0, 5.0, 0.0, 0.0),
(5, 20.0, 0.0, 40.0, 10.0, 0.0, 20.0, 10.0, 0.0, 0.0, 0.0, 0.0);

INSERT INTO information_investor (investor_id, location, currentrole, yourstory, experience, education, expertise, image, Funding_stage_preference, industry_since, companies_invested, revenue_gen, field) VALUES
(1, 'New York', 'Angel Investor', 'Investing in tech startups', '10 years', 'MBA', 'Tech', 'images/image1', 'Seed', 2005, 15, 1000000, 'Technology'),
(3, 'San Francisco', 'Venture Capitalist', 'Focus on healthcare innovations', '15 years', 'PhD', 'Healthcare', 'images/image2', 'Series A', 2000, 10, 5000000, 'Healthcare'),
(5, 'Boston', 'Angel Investor', 'Passionate about education technology', '5 years', 'Masters', 'Education', 'images/image3', 'Pre-Seed', 2010, 5, 500000, 'Education');


INSERT INTO investor_interests (investor_id, interested_field) VALUES
(1, 'Technology'),
(3, 'Healthcare'),
(5, 'Education'),
(1, 'FinancialServices'),
(3, 'InformationTechnology');


INSERT INTO chats (type) VALUES
('twopeople'),
('group'),
('twopeople'),
('group'),
('twopeople');


INSERT INTO messages (chat_id, person_id, message) VALUES
(1, 1, 'Hello, interested in your startup.'),
(2, 1, 'Welcome to the group chat.'),
(1, 2, 'Thank you! Looking forward to discussing.'),
(3, 3, 'Got an interesting pitch for you.'),
(2, 2, 'Glad to join here.');


INSERT INTO chat_twopeople (chat_id, person1_id, person2_id) VALUES
(1, 1, 2),
(3, 3, 4),
(5, 5, 2);


INSERT INTO chat_groupchat_info (chat_id, image, title, admin_id) VALUES
(2, 'images/group_image1', 'Tech Investors', 1),
(4, 'images/group_image2', 'Startup Founders Hub', 2);


INSERT INTO groupchat (chat_id, person_id, role) VALUES
(2, 1, 'admin'),
(2, 3, 'member'),
(4, 2, 'admin'),
(4, 4, 'member'),
(2, 5, 'member');

INSERT INTO people_team_startups (startup_id, Name, Role, Degree_uni, person_image_path) VALUES
(2, 'Sophia Johnson', 'CMO', 'Master in Marketing', 'images/team_image3'),
(2, 'James Williams', 'CFO', 'Master in Finance', 'images/team_image4'),
(4, 'Isabella Brown', 'Lead Developer', 'BS in Computer Science', 'images/team_image5'),
(4, 'Ethan Davis', 'Product Manager', 'MSc in Project Management', 'images/team_image6'),
(2, 'Mia Wilson', 'Design Lead', 'Bachelor in Design', 'images/team_image7'),
(4, 'Olivia Martin', 'HR Manager', 'Master in Human Resources', 'images/team_image8'),
(2, 'Ava Anderson', 'Research Analyst', 'Master in Business Analytics', 'images/team_image9'),
(4, 'Charlotte Lee', 'QA Lead', 'BS in Software Engineering', 'images/team_image10');

INSERT INTO startups_information (startup_id, startup_name, industry, location, vision, usp, motivation, target_market, customer_num, revenue_till_date, Team_size, Founding_year, logo, Funding_stage, Customer_acc_cost, Retention_rate_perc, User_growth_perc, about_team) VALUES
(2, 'Tech Innovations', 'Technology', 'Silicon Valley', 'Innovating everyday life', 'Unique tech solutions', 'To make life easier', 'Global market', 10000, 100000, 10, 2015, 'images/logo1', 'Seed', 500, 85, 20, 'A team of tech enthusiasts'),
(4, 'EduTech Start', 'Education', 'New York', 'Revolutionizing learning', 'Interactive learning platforms', 'To educate the world', 'Students worldwide', 5000, 50000, 5, 2018, 'images/logo2', 'Series A', 200, 90, 30, 'Educators and innovators');


INSERT INTO Swipe (Startup_id, Investor_id, Swipe_successful_inv, Swipe_successful_startup) VALUES
(2, 1, TRUE, TRUE),
(4, 3, TRUE, FALSE),
(2, 5, FALSE, TRUE),
(4, 1, TRUE, TRUE),
(2, 3, FALSE, FALSE);
