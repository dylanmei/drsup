set nocount on
--RESET IT BACK TO NULL
UPDATE tbl$Pictures$album set no_userid=null where no_userId=0
UPDATE tbl$Videos$album set no_userid=null where no_userId=0
DELETE FROM tbl$members WHERE memberid = 0

