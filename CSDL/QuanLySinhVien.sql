-- create database QuanLySinhVien;
-- use QuanLySinhVien;
-- create table Class(class_id int not null auto_increment primary key,class_name varchar(60) not null,start_date datetime not null,status bit);
-- CREATE TABLE Student (
--     student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     student_name VARCHAR(30) NOT NULL,
--     address VARCHAR(50),
--     phone VARCHAR(20),
--     status BIT,
--     class_id INT NOT NULL,
--     FOREIGN KEY (class_id)
--         REFERENCES Class (class_id)
-- );
-- CREATE TABLE Subject (
--     sub_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     sub_name VARCHAR(30) NOT NULL,
--     credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
--     status BIT DEFAULT 1
-- );
CREATE TABLE Mark (
    mark_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    examtimes TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
        REFERENCES Subject (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);