CREATE OR REPLACE PROCEDURE INSERTBOOK (MYBOOKID IN NUMBER, MYBOOKNAME IN VARCHAR2, MYPUBLISHER IN VARCHAR2, MYPRICE IN NUMBER)
AS BEGIN
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE) VALUES(MYBOOKID, MYBOOKNAME, MYPUBLISHER, MYPRICE);
END;
/