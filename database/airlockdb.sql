CREATE DATABASE airlock;
USE airlock;

CREATE TABLE users(
    username VARCHAR(512) NOT NULL PRIMARY KEY,
    accesskey VARCHAR(512) NOT NULL UNIQUE,
    secretkey VARCHAR(512) NOT NULL,
    isNPA BOOLEAN NOT NULL
) COMMENT='User DB for Airlock';

CREATE TABLE tokens(
    sessiontoken VARCHAR(512) NOT NULL PRIMARY KEY,
    username VARCHAR(512) NOT NULL,
    expirationtime DATETIME NOT NULL,
    assumedgroup VARCHAR(512),
	CONSTRAINT `fk_tokens_username`
		FOREIGN KEY (username) REFERENCES users (username)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) COMMENT='Token DB for Airlock';

CREATE TABLE user_groups(
    username VARCHAR(512) NOT NULL,
    groupname VARCHAR(512) NOT NULL,
	PRIMARY KEY (username, groupname),
	CONSTRAINT `fk_user_username`
		FOREIGN KEY (username) REFERENCES users (username)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) COMMENT='User groups DB for Airlock';
