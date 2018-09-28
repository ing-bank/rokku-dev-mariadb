CREATE DATABASE gargoyle;
USE gargoyle;

CREATE TABLE users(
    username VARCHAR(512) NOT NULL PRIMARY KEY,
    accesskey VARCHAR(512) NOT NULL UNIQUE,
    secretkey VARCHAR(512) NOT NULL,
    isNPA BOOLEAN NOT NULL
) COMMENT='User DB for Gargoyle';

CREATE TABLE tokens(
    sessiontoken VARCHAR(512) NOT NULL PRIMARY KEY,
    username VARCHAR(512) NOT NULL,
    expirationdate DATETIME NOT NULL,
    assumedgroup VARCHAR(512),
	CONSTRAINT `fk_tokens_username`
		FOREIGN KEY (username) REFERENCES users (username)
		ON DELETE CASCADE
		ON UPDATE RESTRICT
) COMMENT='Token DB for Gargoyle';
