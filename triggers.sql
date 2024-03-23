CREATE TRIGGER trg_before_groupchat_insert_or_update
BEFORE INSERT ON chat_groupchat_info
FOR EACH ROW
BEGIN
    SELECT RAISE(ABORT, 'A group chat with this title already exists.')
    WHERE EXISTS (SELECT 1 FROM chat_groupchat_info WHERE title = NEW.title);
END;


CREATE TRIGGER trg_before_chats_delete
BEFORE DELETE ON chats
FOR EACH ROW
BEGIN
    DELETE FROM messages WHERE chat_id = OLD.id;
    DELETE FROM chat_twopeople WHERE chat_id = OLD.id;
    DELETE FROM chat_groupchat_info WHERE chat_id = OLD.id;
    DELETE FROM groupchat WHERE chat_id = OLD.id;
END;

CREATE TRIGGER trg_after_startup_info_insert
AFTER INSERT ON startups_information
FOR EACH ROW
BEGIN
    UPDATE startups_information
    SET profile_complete = CASE
        WHEN startup_name IS NOT NULL AND
             industry IS NOT NULL AND
             location IS NOT NULL AND
             vision IS NOT NULL AND
             usp IS NOT NULL AND
             motivation IS NOT NULL AND
             target_market IS NOT NULL AND
             customer_num IS NOT NULL AND
             revenue_till_date IS NOT NULL AND
             Team_size IS NOT NULL AND
             Founding_year IS NOT NULL AND
             logo IS NOT NULL AND
             Funding_stage IS NOT NULL AND
             Customer_acc_cost IS NOT NULL AND
             Retention_rate_perc IS NOT NULL AND
             User_growth_perc IS NOT NULL AND
             about_team IS NOT NULL
        THEN TRUE ELSE FALSE END
    WHERE startup_id = NEW.startup_id;
END;

CREATE TRIGGER trg_after_startup_info_update
AFTER UPDATE ON startups_information
FOR EACH ROW
BEGIN
    UPDATE startups_information
    SET profile_complete = CASE
        WHEN startup_name IS NOT NULL AND
             industry IS NOT NULL AND
             location IS NOT NULL AND
             vision IS NOT NULL AND
             usp IS NOT NULL AND
             motivation IS NOT NULL AND
             target_market IS NOT NULL AND
             customer_num IS NOT NULL AND
             revenue_till_date IS NOT NULL AND
             Team_size IS NOT NULL AND
             Founding_year IS NOT NULL AND
             logo IS NOT NULL AND
             Funding_stage IS NOT NULL AND
             Customer_acc_cost IS NOT NULL AND
             Retention_rate_perc IS NOT NULL AND
             User_growth_perc IS NOT NULL AND
             about_team IS NOT NULL
        THEN TRUE ELSE FALSE END
    WHERE startup_id = NEW.startup_id;
END;

CREATE TRIGGER trg_before_login_delete
BEFORE DELETE ON login
FOR EACH ROW
BEGIN
    DELETE FROM investor_portfolio WHERE investor_id = OLD.id;
    DELETE FROM information_investor WHERE investor_id = OLD.id;
    DELETE FROM investor_interests WHERE investor_id = OLD.id;
    DELETE FROM messages WHERE person_id = OLD.id;
    DELETE FROM chat_twopeople WHERE person1_id = OLD.id OR person2_id = OLD.id;
    DELETE FROM chat_groupchat_info WHERE admin_id = OLD.id;
    DELETE FROM groupchat WHERE person_id = OLD.id;
    DELETE FROM startups_information WHERE startup_id = OLD.id;
    DELETE FROM Swipe WHERE Startup_id = OLD.id OR Investor_id = OLD.id;
END;

CREATE TRIGGER trg_after_investor_info_insert
AFTER INSERT ON information_investor
FOR EACH ROW
BEGIN
    UPDATE information_investor
    SET profile_complete = CASE
        WHEN NEW.location IS NOT NULL AND
             NEW.currentrole IS NOT NULL AND
             NEW.yourstory IS NOT NULL AND
             NEW.experience IS NOT NULL AND
             NEW.education IS NOT NULL AND
             NEW.expertise IS NOT NULL AND
             NEW.image IS NOT NULL AND
             NEW.Funding_stage_preference IS NOT NULL AND
             NEW.industry_since IS NOT NULL AND
             NEW.companies_invested IS NOT NULL AND
             NEW.revenue_gen IS NOT NULL AND
             NEW.field IS NOT NULL
        THEN TRUE ELSE FALSE END
    WHERE investor_id = NEW.investor_id;
END;


CREATE TRIGGER trg_after_investor_info_update
AFTER UPDATE ON information_investor
FOR EACH ROW
BEGIN
    UPDATE information_investor
    SET profile_complete = CASE
        WHEN NEW.location IS NOT NULL AND
             NEW.currentrole IS NOT NULL AND
             NEW.yourstory IS NOT NULL AND
             NEW.experience IS NOT NULL AND
             NEW.education IS NOT NULL AND
             NEW.expertise IS NOT NULL AND
             NEW.image IS NOT NULL AND
             NEW.Funding_stage_preference IS NOT NULL AND
             NEW.industry_since IS NOT NULL AND
             NEW.companies_invested IS NOT NULL AND
             NEW.revenue_gen IS NOT NULL AND
             NEW.field IS NOT NULL
        THEN TRUE ELSE FALSE END
    WHERE investor_id = NEW.investor_id;
END;

CREATE TRIGGER hash_password_insert BEFORE INSERT ON login
FOR EACH ROW
BEGIN
    UPDATE login
    SET Password = SHA256(NEW.Password)
    WHERE id = NEW.id;
END;

CREATE TRIGGER hash_password_update BEFORE UPDATE ON login
FOR EACH ROW
BEGIN
    UPDATE login
    SET Password = SHA256(NEW.Password)
    WHERE id = NEW.id;
END;
