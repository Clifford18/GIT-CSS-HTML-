

DROP DATABASE IF EXISTS `design_to_code`;
CREATE DATABASE `design_to_code`; 

USE `design_to_code`;

  DROP TABLE IF EXISTS `members`; 
  CREATE TABLE `members` (
    `member_id`	bigint	 		NOT NULL AUTO_INCREMENT,
    `member_name` 	varchar(30) 	DEFAULT NULL,
    `username` 	varchar(30) 	NOT NULL,
    `email`		varchar(40) 	DEFAULT NULL,
    `member_type`		varchar(30) 	DEFAULT NULL,
    `date_created` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 	timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`member_id`),
    
    KEY `index_members_date_created`(`date_created`),
    KEY `index_members_date_modified`(`date_modified`),
    
    UNIQUE KEY `uindex_members_username` (`username`)
  );
  INSERT INTO members (member_name, username, email) 
    VALUES ('John Clifford','johnclifford','johnclifford.cj@gmail.com');
      

  DROP TABLE IF EXISTS `projects`;
  CREATE TABLE `projects` (
    `project_id` 			bigint 			NOT NULL AUTO_INCREMENT,
    `username` 		varchar(30)  			NOT NULL,
    `project_name` 	varchar(40)  			NOT NULL,
    `language`	varchar(50) 	NOT NULL,
    `location` 		varchar(45) 	NOT NULL,
    `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`project_id`),    
    
    KEY `index_projects_language`(`language`),
    KEY `index_projects_location`(`location`), 
    KEY `index_projects_date_created`(`date_created`),
    KEY `index_projects_date_modified`(`date_modified`),
  
    UNIQUE KEY `uindex_projects_project_id_username`(`project_id`,`username`),

    KEY `fk_members_projects_username` (`username`),
    CONSTRAINT `fk_members_projects_username` FOREIGN KEY (`username`) REFERENCES `members` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ;

    INSERT INTO projects (project_name, username,  language, location) 
        VALUES 
          ('Workcation','johnclifford','Java','Kenya'),
          ('Easywire','johnclifford','Laravel','USA'),
          ('Easywire','johnclifford','PHP','UK'),
          ('Digest','johnclifford','Next js','Germany'),
          ('Personal Website','johnclifford','Java','Netherland'),
          ('Tail Slides','johnclifford','NodeJS','Sweden'),
          ('KiteTail','johnclifford','TypeScript','South Africa'),
          ('EasyWire','johnclifford','React','Belgium');


  DROP TABLE IF EXISTS `activities`;
  CREATE TABLE `activities` (
    `activity_id` 			bigint 			NOT NULL AUTO_INCREMENT,
    `project_id` 		bigint  			NOT NULL,
    `deployed_from`	varchar(50) 	NOT NULL,
    `deployed_to` 		varchar(45) 	NOT NULL,
    `date_created` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `date_modified` 		timestamp 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`activity_id`),

    KEY `index_activities_date_created`(`date_created`),
    KEY `index_activities_date_modified`(`date_modified`),
    KEY `fk_projects_activities_project_id` (`project_id`),
    CONSTRAINT `fk_projects_activities_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ;

  INSERT INTO activities (project_id, deployed_from, deployed_to)
    VALUES(1, 'master', 'production'),
          (3, 'master', 'staging'),
          (4, 'master', 'production');
				
