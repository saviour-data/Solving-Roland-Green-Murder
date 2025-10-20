<img width="6000" height="3600" alt="image" src="https://github.com/user-attachments/assets/a5c60b74-62bd-441d-8643-8479852dab66" />





# 🕵️‍♂️ Solving the Murder of Roland Greene

## Project Overview
This is a data-driven SQL investigation into the murder of Roland Greene, a renowned art collector found dead in his private estate on June 1st, 2025.  
The project uses **SQL querying and forensic data analysis** to reconstruct the timeline of events, verify alibis, and identify inconsistencies across multiple digital evidence sources.

As the lead data analyst, I was tasked with consolidating and analyzing call records, access logs, and forensic event data to uncover the truth behind the murder.

---

## Objectives
- Integrate multiple evidence datasets (suspects, forensic events, call logs, access logs).  
- Build SQL tables to simulate digital forensics data.  
- Query the data to:
  - Reconstruct the **timeline** of events leading to the murder.  
  - Validate or refute **suspect alibis**.  
  - Identify **patterns and inconsistencies** in digital records.  
- Derive a **final conclusion** supported by data-driven reasoning.

---

## Dataset Description
Four relational tables were created and linked through the `suspect_id` field, forming a cohesive case database for the investigation.

| Table | Description |
|--------|--------------|
| `suspects_large` | A list of suspects with IDs, names, relation to victim, and declared alibis. |
| `forensic_events_large` | Captures timestamps and event descriptions from forensic records (e.g., motion detection, gunshot time). |
| `call_records_large` | Contains call activity between suspects and the victim with duration and relation details. |
| `access_logs_records` | Tracks entry and exit times for suspects accessing restricted areas such as the Vault Room. |

---

### Entity Relationship Overview (ERD Note)
The database follows a **relational model**:
- Each **suspect** (`suspect_id`) can appear in multiple **call records** and **access logs**.  
- **Forensic events** are independent records linked by timestamps rather than suspect IDs.  
- The design ensures data normalization while enabling chronological cross-referencing for timeline reconstruction.



## Methodology
1. **Data Modeling**  
   - Created normalized relational tables in SQL.  
   - Established primary keys and timestamps for chronological reconstruction.

2. **Evidence Analysis**  
   - Used `JOIN`, `WHERE`, and `ORDER BY` clauses to align events from different tables.  
   - Analyzed inconsistencies between **access times** and **declared alibis**.  
   - Constructed a **timeline** from combined forensic and access records.

3. **Suspect Evaluation**  
   - Filtered each suspect’s activity based on event timestamps.  
   - Cross-referenced presence near the crime scene and communications with the victim.

---

## Findings
- **Robin Ahmed** (the victim’s family doctor and former partner) was found in the Vault Room at **7:56:35 PM**, minutes before the gunshot at **8:00 PM**. His alibi was proven false.  
- **Jamie Bennett** entered the Vault shortly after the gunshot (**8:00:55 PM**), matching the motion sensor detection time suggesting she discovered the body, not committed the murder.  
- **Victor Shaw**, a rival and PR manager, accessed the Vault at **8:04:53 PM**, likely after the murder, possibly tampering with the scene.

---

## Conclusion
Based on the SQL analysis of suspects, access logs, call records, and forensic events:
- **Killer:** Robin Ahmed had motive, means, and opportunity.  
- **Accomplice / Evidence Manipulator:** Victor Shaw.  
- **Witness:** Jamie Bennett.

This project demonstrates the practical application of **SQL for investigative analytics**, showcasing how relational queries can be used to reconstruct timelines and test hypotheses from fragmented data sources.

---

## Tools and Technologies
- **Database:** PostgreSQL  
- **Language:** SQL (DDL & DML)  
- **Environment:** PgAdmin 4

---

## Key SQL Concepts Applied
- `CREATE TABLE` and relational modeling  
- Data normalization and timestamp sequencing  
- `JOIN`, `WHERE`, and `ORDER BY` for multi-table analysis  
- Aggregation and filtering for event reconstruction  

