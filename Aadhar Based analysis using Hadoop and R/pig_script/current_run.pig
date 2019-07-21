aadhar_data = LOAD '/home/training/UIDAI-ENR-DETAIL-20170308.csv' using PigStorage(',');
adhaar_accepted = foreach aadhar_data generate $2,$8;
adhaar_schema = foreach adhaar_accepted generate $0 as state,$1 as aadhaar_generated;
makeGroup = group adhaar_schema by state;
countIds = foreach makeGroup generate group,SUM(adhaar_schema.aadhaar_generated);
store countIds into '/home/training/adhaar/adhaar_accepted_state_wise.csv';


adhaar_accepted1 = foreach aadhar_data generate $1,$8;
adhaar_schema1 = foreach adhaar_accepted1 generate $0 as agency,$1 as aadhaar_generated1;
makeGroup1 = group adhaar_schema1 by agency;
countIds1 = foreach makeGroup1 generate group,SUM(adhaar_schema1.aadhaar_generated1);
store countIds1 into '/home/training/adhaar/adhaar_accepted_agency_wise.csv';


adhaar_accepted2 = foreach aadhar_data generate $3,$8;
adhaar_schema2 = foreach adhaar_accepted2 generate $0 as district,$1 as aadhaar_generated2;
makeGroup2 = group adhaar_schema2 by district;
countIds2 = foreach makeGroup2 generate group,SUM(adhaar_schema2.aadhaar_generated2);
order_data = order countIds2 by $1 DESC;
limit_10 = LIMIT order_data 10;
store limit_10 into '/home/training/adhaar/adhaar_accepted_district_wise_10.csv';





