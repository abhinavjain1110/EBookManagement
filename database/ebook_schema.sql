CREATE DATABASE ebook;
USE ebook;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  password VARCHAR(100),
  role VARCHAR(20) DEFAULT 'user'
);

CREATE TABLE ebooks (
  ebook_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  file_path TEXT,
  upload_date DATETIME
);

CREATE TABLE downloads (
  download_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  ebook_id INT,
  download_date DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (ebook_id) REFERENCES ebooks(ebook_id)
);