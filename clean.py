import csv
with open ("/home/matlab/Finance Project/Consumer_Complaints.csv","rb") as source:
     rdr=csv.reader(source)
     source.next()
     with open("/home/matlab/Finance Project/Cleaned_consumer.csv","wb")as result:
       wtr= csv.writer(result)
       for r in rdr:
         wtr.writerow((r[0],r[1],r[3],r[7],r[8],r[9],r[11],r[13],r[14],r[15]))

