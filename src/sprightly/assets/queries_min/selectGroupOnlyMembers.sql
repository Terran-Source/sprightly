SELECT m.* FROM Members m JOIN GroupMembers gm ON gm.memberId=m.id WHERE m.idType='GroupMember' AND gm.groupId=:groupId;
