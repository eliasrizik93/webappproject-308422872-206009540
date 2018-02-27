


	CREATE TABLE USERS(username VARCHAR(30) NOT NULL,email VARCHAR(30) NOT NULL,address VARCHAR(100) NOT NULL,telephone VARCHAR(30) NOT NULL,password VARCHAR(30) NOT NULL,nickname VARCHAR(30) NOT NULL,description VARCHAR(300),photo VARCHAR(200), PRIMARY KEY(username));
	
	CREATE TABLE BOOKS(bookname varchar(200),image varchar(200),price DOUBLE,description VARCHAR(300),numberoflikes INTEGER,url VARCHAR(300), PRIMARY KEY(bookname));
	
	CREATE TABLE BUY(username varchar(30),bookname varchar(200),FOREIGN KEY (username) REFERENCES USERS(username),FOREIGN KEY (bookname) REFERENCES BOOKS(bookname));
	
	CREATE TABLE LIKEBOOK(username varchar(30) NOT NULL,nickname VARCHAR(30) NOT NULL,bookname varchar(200) NOT NULL,FOREIGN KEY (username) REFERENCES USERS(username),FOREIGN KEY (bookname) REFERENCES BOOKS(bookname));
	
	CREATE TABLE REVIEWS(ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),username varchar(30),bookname varchar(200),review varchar(1000),verified INTEGER,PRIMARY KEY(ID),FOREIGN KEY (username) REFERENCES USERS(username),FOREIGN KEY (bookname) REFERENCES BOOKS(bookname));
	
	CREATE TABLE READTABLE(username varchar(30) NOT NULL,bookname varchar(200) NOT NULL,readline DOUBLE,FOREIGN KEY (username) REFERENCES USERS(username),FOREIGN KEY (bookname) REFERENCES BOOKS(bookname));
	
	
	
	
	
	INSERT INTO USERS(username,email,address,telephone,password,nickname,description,photo) VALUES(?,?,?,?,?,?,?,?);
	
	INSERT INTO BOOKS(bookname,image,price,description,numberoflikes,url) VALUES(?,?,?,?,?,?);	
	
	INSERT INTO LIKEBOOK(username,nickname,bookname) values(?,?,?);
	
	INSERT INTO REVIEWS(username,bookname,review,verified) VALUES(?,?,?,?);	
	
	INSERT INTO BUY(username,bookname) VALUES(?,?);	
	
	INSERT INTO READTABLE(username,bookname,readline) VALUES(?,?,?);	
	
	
	
	
	
	SELECT * FROM USERS WHERE UserName=? AND Password=?;
	
	SELECT * FROM USERS WHERE username=? OR email=?;
	
	SELECT * FROM USERS WHERE UserName=?;
	
	SELECT * FROM BUY WHERE USERNAME=?;
	
	SELECT * FROM LIKEBOOK WHERE username=? AND bookname=?;
	
	SELECT * FROM buy WHERE username=? AND bookname=?;
	
	SELECT * FROM BOOKS;
	
	SELECT * FROM BUY WHERE username=?;
	
	SELECT * FROM BOOKS INNER JOIN BUY ON books.bookname = BUY.bookname where username=?;	
	
	SELECT * FROM USERS INNER JOIN LIKEBOOK ON USERS.username = LIKEBOOK.username where LIKEBOOK.bookname=?;
	
	SELECT * FROM likebook where bookname=?;	
	
	SELECT * FROM readtable where username=? and bookname=?;
	
	SELECT * FROM readtable INNER JOIN books ON readtable.bookname = books.bookname where readtable.username=? and readtable.bookname=?;
	
	SELECT * FROM REVIEWS WHERE bookname=? AND verified=?;
	
	SELECT * FROM REVIEWS WHERE verified=?;
	
	SELECT * FROM REVIEWS WHERE verified=? and bookname=?;
	
	SELECT * FROM reviews INNER JOIN users ON USERS.username = reviews.username where reviews.bookname=? and verified = ?;
	
	SELECT * FROM USERS where username<>'admin';
	
	SELECT * FROM Buy;
	
	SELECT * FROM USERS where username<>'admin' and  lower(username) like ?;	
	
	SELECT * FROM USERS where username=?;
	

	
	
	

	DELETE FROM LIKEBOOK WHERE username=? AND bookname=?;
	
	DELETE FROM USERS WHERE username = ?;
	
	DELETE FROM LIKEBOOK WHERE username=?;
	
	DELETE FROM BUY WHERE username=?;
	
	DELETE FROM REVIEWS WHERE username=?;
	
	DELETE FROM READTABLE WHERE username=?;
	
	
	
	
	
	UPDATE BOOKS SET numberoflikes=numberoflikes+1 WHERE bookname=?;
	
	UPDATE BOOKS SET numberoflikes=numberoflikes-1 WHERE bookname=?;
	
	UPDATE REVIEWS SET verified=1 WHERE ID=?;
	
	UPDATE READTABLE SET readline=? WHERE username=? and bookname=?;