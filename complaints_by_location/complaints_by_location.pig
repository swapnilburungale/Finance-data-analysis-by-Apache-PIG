consumer = load '/swap/Cleaned_consumer.csv' using PigStorage (',')as(date:chararray,product:chararray,issue:chararray,company:chararray,state:chararray,zip:int,date_send:chararray,timely_response:chararray,desputed:chararray,id:chararray);
locationwise= group consumer by state;
compaints = foreach locationwise generate group as location , COUNT(consumer) as complaints;
ordered = order compaints by complaints DESC;
store ordered into '/outputdata/complaints_by_location' using PigStorage('\t');
