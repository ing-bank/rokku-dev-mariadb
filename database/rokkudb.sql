CREATE DATABASE rokku;
USE rokku;

CREATE TABLE users(
    username VARCHAR(512) NOT NULL PRIMARY KEY,
    accesskey VARCHAR(512) NOT NULL UNIQUE,
    secretkey VARCHAR(512) NOT NULL,
    isNPA BOOLEAN NOT NULL,
    isEnabled BOOLEAN NOT NULL
) COMMENT='User DB for Rokku';

CREATE TABLE tokens(
    sessiontoken VARCHAR(512) NOT NULL PRIMARY KEY,
    username VARCHAR(512) NOT NULL,
    expirationtime DATETIME NOT NULL,
    assumerole VARCHAR(512),
	CONSTRAINT `fk_tokens_username`
		FOREIGN KEY (username) REFERENCES users (username)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) COMMENT='Token DB for Rokku';

CREATE TABLE user_groups(
    username VARCHAR(512) NOT NULL,
    groupname VARCHAR(512) NOT NULL,
	PRIMARY KEY (username, groupname),
	CONSTRAINT `fk_user_username`
		FOREIGN KEY (username) REFERENCES users (username)
		ON DELETE CASCADE
		ON UPDATE CASCADE
) COMMENT='User groups DB for Rokku';

CREATE TABLE tokens_arch(
    sessiontoken VARCHAR(512) NOT NULL PRIMARY KEY,
    username VARCHAR(512) NOT NULL,
    expirationtime DATETIME NOT NULL,
    assumerole VARCHAR(512),
	arch_date DATETIME NOT NULL
) COMMENT='Archive token DB for Rokku';
