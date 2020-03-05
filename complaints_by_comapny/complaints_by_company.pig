consumer = load '/swap/Cleaned_consumer.csv' using PigStorage (',')as (date:chararray,product:chararray,issue:chararray,company:chararray,state:chararray,zip:int,date_send:chararray,timely_response:chararray,desputed:chararray,id:chararray);
companywise = group consumer by company;
compaints = foreach companywise generate group as company , COUNT(consumer) as complaints;
ordered = order compaints by complaints DESC;
store ordered into '/outputdata/complaints_by_company' using PigStorage(',');
