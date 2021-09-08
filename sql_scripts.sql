



DROP DATABASE IF EXISTS `git_management_system`;
CREATE DATABASE `git_management_system`; 
USE `git_management_system`;

-- member
--- Name 
--- Username
--- Email
--- Membertype


DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
   `member_id`	bigint	 		NOT NULL AUTO_INCREMENT,
   `member_name` 	varchar(30) 	DEFAULT NULL,
   `username` 	varchar(30) 	NOT NULL,
   `email`		varchar(40) 	DEFAULT NULL,
   `member_type`		varchar(30) 	DEFAULT NULL,
   `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`employee_id`),
   UNIQUE KEY `uindex_employees_username` (`username`)
 );
 
 -- project 
--- fk Username
--- Project name
--- Last time deployed
--- Language
--- Location

 DROP TABLE IF EXISTS `projects`;

 CREATE TABLE `projects` (
   `project_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `username` 		varchar(30)  			NOT NULL,
   `language`	varchar(50) 	NOT NULL,
   `location` 		varchar(45) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   PRIMARY KEY (`project_id`),
   KEY `members_projects_fk` (`username`),
   CONSTRAINT `fk_members_projects_username` FOREIGN KEY (`username`) REFERENCES `members` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ;
 
 -- Activity
--- fk username
--- fk project
--- time stamp
--- deployed to ()
--- deployed from
 
 CREATE TABLE `activities` (
   `activity_id` 			bigint 			NOT NULL AUTO_INCREMENT,
   `username` 		varchar(30)  			NOT NULL,
   `project_id` 		bigint  			NOT NULL,
   `deployed_from`	varchar(50) 	NOT NULL,
   `deployed_to` 		varchar(45) 	NOT NULL,
   `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   
   PRIMARY KEY (`activity_id`),
   KEY `projects_activities_fk` (`username`),
   CONSTRAINT `fk_projects_activities_username` FOREIGN KEY (`username`) REFERENCES `projects` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
   KEY `projects_activities_fk` (`project_id`),
   CONSTRAINT `fk_projects_activities_username` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ;
 