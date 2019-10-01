CREATE DATABASE rokku_scanner CHARACTER SET utf8 COLLATE utf8_general_ci;

USE rokku_scanner;

CREATE TABLE scan_results(
    id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    object VARCHAR(512) NOT NULL,
    username VARCHAR(512) NOT NULL,
    result VARCHAR(20) NOT NULL,
    moved_to VARCHAR(512) NOT NULL,
    etag VARCHAR(50) NOT NULL, 
    step VARCHAR(15) NOT NULL, 
    request_id VARCHAR(37) NOT NULL,
    timestamp VARCHAR(32) NOT NULL
) COMMENT='DB for RokkuScanner';
