-- Các lệnh thêm index:
-- Thêm index cho bảng, với index mang tính duy nhất và không thể null
-- ALTER TABLE tbl_name ADD PRIMARY KEY (column 1, column 2,..)

-- Thêm index cho bảng, với index mang tính duy nhất nhưng có thể null
-- ALTER TABLE tbl_name ADD UNIQUE index_name (column 1, column 2,..)

-- Thêm index cho bảng, có thể trùng lặp
-- ALTER TABLE tbl_name ADD INDEX index_name (column 1, column 2,..)

-- Thêm index đặc biệt thường cho tìm kiếm văn bản
-- ALTER TABLE tbl_name ADD FULLTEXT index_name (column 1, column 2,..)

-- Tạo index trên một bảng:
-- CREATE UNIQUE INDEX index_name ON table_name;

-- Tạo index cho cột được chỉ rõ trong bảng:
-- CREATE UNIQUE INDEX index_name ON table_name(column 1, column 2,...);

-- Cú pháp cơ bản của lệnh DROP INDEX:
-- DROP INDEX index_name;