# Enterprise Database Systems

These are the files from my final project for CMIT-310 Enterprise Database Systems course.

## Below is the project overview with requirements.

---

## Final Project Overview

You are tasked with finishing development of a section of an existing database system (Champlain Charity LLC). The system is for a local charity and includes multiple schemas. Having been developed over time, the existing data may have some inconsistencies and existing stored procedures and functions may have been developed using older or varying techniques to accomplish similar tasks. This is normal in any production database. In fact, most production databases have some functionality that is no longer used but is left in place due to the difficulty of altering RDBMS (Relational Database Management System).

The contractor that was hired to create a volunteer management schema for Champlain Charities, LLC was not able to complete the assignment. You were hired to finish the task. The project will require the use of two schemas: Person and Volunteer. Your work is limited to the database and does not include designing an interface. The volunteer functionality will be used to track volunteers for several organizations within the charity, though only the food shelf uses the database directly.

The Volunteers work for:
* Food Shelf
* Administration
* Housing
* Outreach
* Fund Raising

Job functions by Organization:
* **Food Shelf**: Intake Worker, Warehouse worker, Inventory, Vendor Management
* **Administration**: Administrative Assistant, Financial Assistant
* **Housing**: Coordinator, Client Outreach
* **Outreach**: Media Relations, Marketing Assistant
* **Fundraising**: Charity Outreach, Fundraiser, Event Coordinator, Event Volunteer

The contract requires that you develop stored procedures, functions and tables, as needed to support basic data insert, update and delete functionality as well as basic reporting needs. The insert, update and delete functionality shall use transaction processing and error handling. Tables with names beginning with LU are lookup tables and they do not need stored procedures, though you will need to insert data for the client.

As part of your task, you will need to review existing volunteer tables and any relevant tables and stored procedures in Person to determine whether modifications need to be done and whether there is any overlap in functionality that can be combined, or removed because it is not needed.

The client wants volunteer contact information and emergency contact information to be separate from information in the Person Schema due to concerns with privacy regulations.

The volunteer functionality relies heavily on the development of a scheduling system for volunteers. The functionality shall include information about when a volunteer is scheduled and where. A volunteer is not required to work every week, but may work more than once a week. Additionally, each volunteer may work for more than one organization and in more than one position.

The Database contains the following Schemas:
* **DBO** (Database Owner): This is a default schema that is automatically used on table creation, if no other schema is specified. It can also be used if the database only needs one schema. It has no special functionality over other schema names. In our database, the dbo schema is used as a catchall for tables that do not fit other schemas.  You will not use this schema in your project.
* **Person**: The Person schema contains information about people that either work for the charity, volunteer, or are clients of the charity.  You will utilize part of this schema to hold demographic information about individual volunteers.
* **Food** shelf: This schema manages clients of the charity’s food shelf program. It is the heart of the client database for the organization. You will not use this schema, but the structure of the tables, functions and stored procedures in this schema might be useful as examples to review in developing your code.
* **Maintenance**: Tracks database maintenance and is not relevant to your project.
* **Message**: Is for message journaling and is not relevant to your project.
* **Signature**: Holds tables that store encrypted client signatures captured by signature pads. This is not relevant to your project.
* **SSN**: This schema holds only one table to secure client Social Security Numbers and is not relevant to your project.
* **Volunteer**: This schema is the heart of your project and contains some tables. You may decide to use, modify, or replace the existing tables.