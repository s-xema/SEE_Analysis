CREATE TABLE [dbo].[log_info]
(
 [tablename1] [varchar](4000)  NULL,
 [collectdate] [DATETIME2] (6) NULL
)

insert into [dbo].[log_info] values('fact_ccaa', '2017-12-31T00:00:00Z');



CREATE TABLE dbo.fact_balance
(
    id VARCHAR (20) NULL,
    "value" float NULL,
    "date" [DATETIME2] (6) NULL 
)
;

CREATE TABLE dbo.stg_table_balance
(
    id VARCHAR (20) NULL,
    "value" float NULL,
    "date" [DATETIME2] (6) NULL 
)
;


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

/*CREATE PROCEDURE dbo.test
AS
BEGIN

INSERT INTO dbo.log_info 
VALUES  ('fact_balance', variable('mes'))


end*/
SELECT max([collectdate]) from [dbo].[log_info] where [tablename1] = 'fact_balance'