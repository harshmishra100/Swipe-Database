BEGIN TRANSACTION;
DELETE FROM login WHERE id = 3;
COMMIT;

BEGIN TRANSACTION;
UPDATE chat_groupchat_info SET admin_id = 3 WHERE admin_id = 1 AND chat_id=2;
UPDATE groupchat SET role = 'admin' WHERE chat_id = 2 AND person_id = 3;
UPDATE groupchat SET role = 'member' WHERE chat_id = 2 AND person_id = 1;
ROLLBACK;
