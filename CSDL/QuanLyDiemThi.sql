CREATE TABLE HocSinh (
    MaHS VARCHAR(20) PRIMARY KEY ,
    TenHS VARCHAR(50),
    NgaySinh DATETIME,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);
CREATE TABLE MonHoc (
    MaMH VARCHAR(20) PRIMARY KEY,
    TenMH VARCHAR(20)
);
CREATE TABLE BangDiem (
    MaHS VARCHAR(20),
    MaMH VARCHAR(20),
    diemthi INT,
    NgayKT DATETIME,
    PRIMARY KEY (MaHS , MaMH),
    FOREIGN KEY (MaHS)
        REFERENCES HocSinh (MaHS),
    FOREIGN KEY (MaMH)
        REFERENCES MonHoc (MaMH)
);
CREATE TABLE GiaoVien (
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(20),
    SDT VARCHAR(10)
);
alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint fk_MaGV foreign key (MaGV) references GiaoVien(MaGV);