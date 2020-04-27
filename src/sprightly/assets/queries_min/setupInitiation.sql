BEGIN TRANSACTION;
INSERT INTO AppSettings(name,value,type) VALUES('dbVersion','0','Number');
INSERT INTO AppSettings(name,value,type) VALUES('primarySetupComplete','false','Bool');
INSERT INTO AppSettings(name,value,type) VALUES('themeMode','Dark','String');
END TRANSACTION;
