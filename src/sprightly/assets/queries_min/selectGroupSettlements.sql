SELECT s.* FROM Settlements s JOIN Groups g ON g.id=s.groupId WHERE g.id=:groupId AND s.isTemporary=IFNULL(:isTemporary,s.isTemporary);
