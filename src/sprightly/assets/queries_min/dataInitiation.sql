BEGIN TRANSACTION;
INSERT INTO Categories(name,type) VALUES('Expenses','Expense');
INSERT INTO Categories(name,type) VALUES('Liability','Liability');
INSERT INTO Categories(name,type) VALUES('Income','Income');
INSERT INTO Categories(name,type) VALUES('Investment','Investment');
INSERT INTO Categories(name,type) VALUES('Misc','Misc');
END TRANSACTION;
