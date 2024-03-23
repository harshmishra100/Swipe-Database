-- Search for startups in a specific location and with a certain industry 
SELECT 
  startup_name, 
  vision, 
  usp,
  Founding_year,
  Team_size
FROM startups_information
WHERE location = 'Silicon Valley'
AND industry = 'Technology';


-- Search for investors in a specific location 
SELECT 
  l.Name, 
  ii.currentrole, 
  ii.experience, 
  ii.education,
  ii.Funding_stage_preference
FROM login l
JOIN information_investor ii ON l.id = ii.investor_id
WHERE l.Accounttype = 'investor'
AND ii.location = 'New York';


-- Filter startups based on funding stage and industry
SELECT 
  startup_name, 
  location, 
  vision,
  Founding_year,
  Team_size
FROM startups_information
WHERE Funding_stage = 'Seed'
AND industry = 'Technology';

-- Filter investors based on expertise and funding stage preference
SELECT 
  l.Name, 
  ii.currentrole, 
  ii.experience, 
  ii.education,
  ii.industry_since
FROM login l
JOIN information_investor ii ON l.id = ii.investor_id
WHERE l.Accounttype = 'investor'
AND ii.expertise = 'Healthcare'
AND ii.Funding_stage_preference = 'Series A';


-- Match startups with investors based on common interests
SELECT 
  l.Name AS Investor_Name,
  si.startup_name as "possible investment startup name", 
  si.industry,
  si.vision,
  si.usp
FROM investor_interests ii
JOIN startups_information si ON ii.interested_field = si.industry
JOIN login l ON ii.investor_id = l.id
WHERE l.id = 1
AND l.Accounttype = 'investor';



-- Fetch recent messages between two users person with id 1 and person id 2
SELECT 
  m.message, 
  m.timestamp,
  sender.Name AS Sender,
  receiver.Name AS Receiver
FROM messages m
JOIN login sender ON m.person_id = sender.id
JOIN chat_twopeople ct ON m.chat_id = ct.chat_id
JOIN login receiver ON (ct.person1_id = receiver.id OR ct.person2_id = receiver.id) AND receiver.id != m.person_id
WHERE ct.chat_id IN 
    (SELECT chat_id FROM chat_twopeople WHERE person1_id = 1 OR person2_id = 1 AND person1_id=2 OR person2_id=2)
ORDER BY m.timestamp DESC
LIMIT 10;


-- Fetch recent messages in a group chat
SELECT 
  m.message, 
  m.timestamp,
  l.Name AS Sender,
  cgi.title AS Group_Title
FROM messages m
JOIN login l ON m.person_id = l.id
JOIN chat_groupchat_info cgi ON m.chat_id = cgi.chat_id
WHERE cgi.title = 'Tech Investors'
ORDER BY m.timestamp DESC
LIMIT 10;


-- Check for successful matches between startups and investors
SELECT 
  s.Startup_id, 
  s.Investor_id,
  si.startup_name,
  l.Name AS Investor_Name
FROM Swipe s
JOIN login l ON s.Investor_id = l.id
JOIN startups_information si ON s.Startup_id = si.startup_id
WHERE s.Swipe_successful_inv = TRUE AND s.Swipe_successful_startup = TRUE;


-- check for unsuccessful matches between startups and investors 

SELECT 
  si.startup_name AS Startup_Name,
  l.Name AS Investor_Name,
  CASE
    WHEN s.Swipe_successful_inv = FALSE AND s.Swipe_successful_startup = TRUE THEN 'Investor declined'
    WHEN s.Swipe_successful_inv = TRUE AND s.Swipe_successful_startup = FALSE THEN 'Startup declined'
    ELSE 'Both declined'
  END AS Reason_for_Unsuccessful_Match
FROM Swipe s
JOIN login l ON s.Investor_id = l.id
JOIN startups_information si ON s.Startup_id = si.startup_id
WHERE s.Swipe_successful_inv = FALSE OR s.Swipe_successful_startup = FALSE;


-- Check if an investor's profile is complete
SELECT 
  investor_id, 
  profile_complete,
  location,
  currentrole,
  expertise
FROM information_investor
WHERE investor_id = 1 AND profile_complete = TRUE;


-- Check if a startup's profile is complete
SELECT 
  startup_id, 
  profile_complete,
  startup_name,
  industry,
  vision
FROM startups_information
WHERE startup_id = 2 AND profile_complete = TRUE;
