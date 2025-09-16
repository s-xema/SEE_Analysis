CREATE PROCEDURE dbo.loaddatainter
AS
BEGIN

INSERT INTO dbo.fact_inter(
    "country",
    "value",
    "date" 
)
select * from dbo.stg_table_inter b
where b.date > (SELECT max([collectdate]) from [dbo].[log_info] where [tablename1] = 'fact_inter'); /*(select max(collectdate) from dbo.log_info);*/


INSERT INTO dbo.log_info 
VALUES  ('fact_inter', (select max("date") from dbo.stg_table_inter))


end