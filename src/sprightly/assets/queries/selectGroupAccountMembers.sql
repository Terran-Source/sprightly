-- -- sprightly_db

-- selectGroupAccountMembers
SELECT m.*
 FROM Members m
 JOIN GroupMembers gm ON gm.memberId=m.id
 WHERE m.idType='Group' AND gm.groupId=:groupId;

-- -- sprightly_setup
