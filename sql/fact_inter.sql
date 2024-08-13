insert into [dbo].[log_info] values('fact_ccaa', '2017-12-31T00:00:00Z');


CREATE TABLE dbo.stg_table_inter
(
    "country" VARCHAR (20) NULL,
    "value" float NULL,
    "date" [DATETIME2] (6) NULL 
)
;

CREATE TABLE dbo.fact_inter
(
    "country" VARCHAR (20) NULL,
    "value" float NULL,
    "date" [DATETIME2] (6) NULL 
)
;

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