//// sprightly_db

// groupOnlyMembers
SELECT m.*
 FROM Members m
 JOIN GroupMembers gm ON gm.memberId=m.id
 WHERE idType='Group' AND gm.groupId=:groupId;

//// sprightly_setup
