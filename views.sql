CREATE VIEW investor_details AS
SELECT
  l.Name,
  l.Email,
  ii.location,
  ii.currentrole,
  ii.yourstory,
  ii.experience,
  ii.education,
  ii.expertise,
  ii.image,
  ii.Funding_stage_preference,
  ii.industry_since,
  ii.companies_invested,
  ii.revenue_gen,
  ii.field,
  ip.Agriculture,
  ip.Manufacturing,
  ip.InformationTechnology,
  ip.Pharmaceuticals,
  ip.Automobile,
  ip.FinancialServices,
  ip.Infrastructure,
  ip.TourismHospitality,
  ip.EducationTraining,
  ip.RetailEcommerce,
  ip.anyother
FROM login l
JOIN information_investor ii ON l.id = ii.investor_id
JOIN investor_portfolio ip ON l.id = ip.investor_id
WHERE l.Accounttype = 'investor';


CREATE VIEW investor_interests_view AS
SELECT
  l.Name,
  l.Email,
  ii.interested_field
FROM login l
JOIN investor_interests ii ON l.id = ii.investor_id
WHERE l.Accounttype = 'investor';


CREATE VIEW startup_details AS
SELECT
  l.Name,
  l.Email,
  si.startup_name,
  si.industry,
  si.location,
  si.vision,
  si.usp,
  si.motivation,
  si.target_market,
  si.customer_num,
  si.revenue_till_date,
  si.Team_size,
  si.Founding_year,
  si.logo,
  si.Funding_stage,
  si.Customer_acc_cost,
  si.Retention_rate_perc,
  si.User_growth_perc,
  si.about_team,
  si.profile_complete
FROM login l
JOIN startups_information si ON l.id = si.startup_id
WHERE l.Accounttype = 'startup';

CREATE VIEW startup_team_view AS
SELECT
  si.startup_name,
  pts.Name AS team_member_name,
  pts.Role,
  pts.Degree_uni,
  pts.person_image_path
FROM startups_information si
JOIN people_team_startups pts ON si.startup_id = pts.startup_id;

CREATE VIEW recent_messages_one_on_one AS
SELECT
    ct.chat_id AS chat_id,
    l1.Name AS sender_name,
    l2.Name AS receiver_name,
    m.message,
    m.timestamp
FROM messages m
JOIN chat_twopeople ct ON m.chat_id = ct.chat_id
JOIN chats c ON ct.chat_id = c.id 
JOIN login l1 ON m.person_id = l1.id
JOIN login l2 ON (l2.id = ct.person1_id OR l2.id = ct.person2_id) AND l2.id != m.person_id
WHERE m.timestamp IN (
    SELECT MAX(timestamp)
    FROM messages
    GROUP BY chat_id
)
AND c.type = 'twopeople';



CREATE VIEW recent_messages_group_chat AS
SELECT
    cgi.title AS group_title,
    l.Name AS sender_name,
    m.message,
    m.timestamp
FROM messages m
JOIN chats c ON m.chat_id = c.id AND c.type = 'group'
JOIN chat_groupchat_info cgi ON c.id = cgi.chat_id
JOIN login l ON m.person_id = l.id
WHERE m.timestamp IN (
    SELECT MAX(timestamp)
    FROM messages
    GROUP BY chat_id
);

CREATE VIEW all_messages_details AS
SELECT
    c.id AS chat_id,
    c.type AS chat_type,
    l.Name AS sender_name,
    m.message,
    m.timestamp
FROM messages m
JOIN chats c ON m.chat_id = c.id
JOIN login l ON m.person_id = l.id;

CREATE VIEW SwipeDetails AS
SELECT
    si.startup_name,
    si.industry,
    l.Name AS investor_name,
    s.Swipe_successful_inv,
    s.Swipe_successful_startup,
    (s.Swipe_successful_inv AND s.Swipe_successful_startup) AS match
FROM Swipe s
JOIN startups_information si ON s.Startup_id = si.startup_id
JOIN login l ON s.Investor_id = l.id
WHERE l.Accounttype = 'investor';

CREATE VIEW SwipeDetailsSuccess AS
SELECT
    si.startup_name,
    si.industry,
    l.Name AS investor_name,
    (s.Swipe_successful_inv AND s.Swipe_successful_startup) AS match
FROM Swipe s
JOIN startups_information si ON s.Startup_id = si.startup_id
JOIN login l ON s.Investor_id = l.id
WHERE l.Accounttype = 'investor' AND match=1;
