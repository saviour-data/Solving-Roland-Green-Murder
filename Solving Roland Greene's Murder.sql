
create table
	suspects(suspect_id integer, name varchar, role varchar, relation_to_victim varchar, alibi varchar);

create table 
	forensic_events(event_time timestamp, event_description varchar);

create table 
	call_records(call_id integer, suspect_id integer, call_time timestamp, call_duration varchar, recepient_relation varchar);

create table 
	access_logs(log_id integer, suspect_id integer, access_time timestamp, door_accessed varchar, success_flag boolean);


-- Was anyone in the vault room shortly before or after the murder time (8pm)
select name, role, relation_to_victim, access_time, door_accessed, success_flag
 from access_logs a
 join suspects s
 using(suspect_id)
 where access_time between '2025-06-01 19:55:00' and '2025-06-01 20:05:00'
 and door_accessed = 'Vault Room'
 and success_flag = 'true'
 ;


-- what does the call log reveal about he final phone call
select name, role, call_duration, relation_to_victim, recepient_relation
from call_records c
join suspects s
using(suspect_id)
where call_time between '2025-06-01 19:55:00' and '2025-06-01 20:05:00'
and recepient_relation = 'Victim'
;


-- Are there any inconsistencies between the door access logs and the alibi claims
select name, role, relation_to_victim, alibi, access_time, door_accessed, success_flag
from suspects c
join access_logs a
using(suspect_id)
where access_time between '2025-06-01 19:55:00' and '2025-06-01 20:05:00'
and door_accessed = 'Vault Room'
and success_flag = 'true'
;


-- what does the forensic timeline say about he time and manner of death
select *
from forensic_events
order by event_time;


-- Which suspect movement timeline overlaps with the critical time window
select name, door_accessed, access_time, alibi, event_description, event_time
from access_logs a
join suspects s
using(suspect_id)
join forensic_events f
on access_time between event_time - interval '1 minute'
					and	event_time + interval '1 minute'
	where door_accessed = 'Vault Room'
	order by access_time;
