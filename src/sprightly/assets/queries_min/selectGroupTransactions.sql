SELECT t.* FROM Transactions t JOIN Groups g ON g.id=t.groupId WHERE g.id=:groupId;
