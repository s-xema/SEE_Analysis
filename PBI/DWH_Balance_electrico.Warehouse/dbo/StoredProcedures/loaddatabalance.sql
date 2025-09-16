CREATE PROCEDURE dbo.loaddatabalance
AS
BEGIN

INSERT INTO dbo.fact_balance(
    id,
    "value",
    "date" 
)
select * from dbo.stg_table_balance  a
where a.date > (select max(collectdate) from dbo.log_info where [tablename1] = 'fact_balance');


INSERT INTO dbo.log_info 
VALUES  ('fact_balance', (select max("date") from dbo.stg_table_balance))


end