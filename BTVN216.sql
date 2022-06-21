use btvn216;

create table NhaCungCap (
   MaNCC int primary key,
   TenNCC varchar(255),
   DiaChiNCC varchar(50),
   SoDTNCC varchar(15),
   MaSoThue int unique
);
Create table LoaiDichVu(
   MaLoaiDV INT primary key,
   TenLoaiDV varchar(50)
);
Create table MucChi(
   MaMP int primary key,
   DonGia double ,
   Mota varchar(255),
   Check(DonGia >0)
);
Create table DongXe(
   DongXe int primary key,
   Hangxe varchar(50),
   SoChoNgoi int
);
Create table DangKyCungCap(
    MaDKCC INT primary key,
    MaNCC INT,
    MaLoaiDV int,
    Dongxe int ,
    MaMP int ,
    NgayBDCC date,
    NgayKTCC date,
    SLXDK INT ,
    foreign key(MaNCC) references NhaCungCap(MaNCC),
	foreign key(MaLoaiDV) references LoaiDichVu(MaLoaiDV),
    foreign key(MaMP) references MucChi(MaMP),
	foreign key(Dongxe) references Dongxe(Dongxe)
);
-- Thao tac CSDL :
-- Cau 3:
select * from DongXe where  SoChoNgoi >5;
-- Cau 4:
select * from NhaCungCap join DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC
 join Dongxe on Dongxe.DongXe =DangKyCungCap.DongXe join MucChi on MucChi.MaMP =DangKyCungCap.MaMP
 where (Hangxe="Toyota" and Dongia>15) or (Hangxe="KIA" and Dongia>20);
 -- CAU 5:
 select * from NhaCungCap  order by MaSoThue desc; 
 select * from NhaCungCap order by TenNCC;
 -- Cau6:
 select MaNCC, count(MaNCC) sl from   DangKyCungCap where NgayBDCC ="2015-11-20" group by(MaNCC) ;
 -- cau 7:
 select hangxe from dongxe group by(hangxe);
 -- select 8:
 select MaDKCC,TenNCC,DiaChiNCC,MaSoThue,TenLoaiDV,Hangxe,NgayBDCC,NgayKTCC
  from NhaCungCap left join  DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC
 join Dongxe on Dongxe.DongXe =DangKyCungCap.DongXe join MucChi on MucChi.MaMP =DangKyCungCap.MaMP
 join LoaiDichVu on LoaiDichVu.MaLoaiDV=DangKyCungCap.MaLoaiDV ;
 -- cau 9:
 select TenNCC,SoDTNCC,DiaChiNCC   from NhaCungCap  join  DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC
 join Dongxe on Dongxe.DongXe =DangKyCungCap.DongXe  where Hangxe="KIA";
 -- cau 10:
 select * from NhaCungCap left join  DangKyCungCap on NhaCungCap.MaNCC=DangKyCungCap.MaNCC where MADKCC is null; 