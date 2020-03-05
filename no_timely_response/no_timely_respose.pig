consumer = load '/swap/Cleaned_consumer.csv' using PigStorage (',')as (date:chararray,product:chararray,issue:chararray,company:chararray,state:chararray,zip:int,date_send:chararray,timely_response:chararray,desputed:chararray,id:chararray);
filt = filter consumer by timely_response == 'No';
locationwise = group filt by state;
compaints = foreach locationwise generate group as location , flatten(filt.company) as company;
store compaints into '/outputdata/no_timely_reapose' using PigStorage('\t');
