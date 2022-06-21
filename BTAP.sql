use bai_4;
Create table Khoa (
    MaKhoa int primary key ,
    TenKhoa varchar(255)
);
Create table Lop(
    MaLop int primary key,
    TenLop varchar(20),
    MaKhoa int ,
     Foreign key (MaKhoa) references Khoa(MaKhoa)
);
create table SinhVien(
    MaHV int primary key,
    TenSV varchar(20),
    NgaySinhSV datetime,
    HocBong varchar(20),
    GioiTinh varchar(20),
    MaLop int ,
    Foreign key (MaLop) references Lop(MaLop)
);
Create table MonHoc(
     MaMonHoc INT PRIMARY KEY,
     TenMonHoc varchar(255),
     SoTiet int 
);
Create table KetQua(
   DiemThi float ,
    MaHv int,
    MaMonHoc int,
   primary key  (MaHv ,MaMonHoc) 
);
 -- cAU 1:
 select TenSV from SinhVien where TenSV like "Tran%";
 select TenSV from SinhVien where GioiTinh ="nu" and HocBong is not null;
 select TenSV from SinhVien where  year(NgaySinhSV) between 1978 and 1985;
 select * from  SinhVien order by MaHV;
 select * from SinhVien inner join Lop on SinhVien.MaLop = Lop.MaLop  inner join Khoa on Khoa.MaKhoa = Lop.MaKhoa having TenKhoa="Cntt" and HocBong is not null;
 select TenLop, count(MaHV is not null) soluong from  SinhVien  inner join Lop  on SinhVien.MaLop = Lop.MaLop group by TenLop ;
 select TenKhoa ,count(MaHV is not null) soluong from SinhVien  inner join Lop  on SinhVien.MaLop = Lop.MaLop inner join Khoa on Khoa.MaKhoa = Lop.MaKhoa group by TenKhoa; 
  select TenKhoa ,count(MaHV) soluong from SinhVien  inner join Lop  on SinhVien.MaLop = Lop.MaLop inner join Khoa on Khoa.MaKhoa = Lop.MaKhoa where GioiTinh="nu" group by TenKhoa  ; 
