CREATE PROCEDURE dbo.loaddataccaa
AS
BEGIN

INSERT INTO dbo.fact_ccaa(
    "ccaa",
    "id",
    "value",
    "date" 
)
select * from dbo.stg_table_ccaa b
where b.date > (SELECT max([collectdate]) from [dbo].[log_info] where [tablename1] = 'fact_ccaa'); /*(select max(collectdate) from dbo.log_info);*/


INSERT INTO dbo.log_info 
VALUES  ('fact_ccaa', (select max("date") from dbo.stg_table_ccaa))


end