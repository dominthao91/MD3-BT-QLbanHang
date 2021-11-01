create database quanlybanhang;
use quanlybanhang;
create table Customer(
                         cID int auto_increment primary key,
                         Name varchar(25),
                         cAge tinyint
);
create table aOrder(
                       oID int auto_increment primary key,
                       cID int,
                       oDate datetime,
                       oTotalPrice int,
                       foreign key (cID) references Customer (cID)
);
create table Product(
                        pID int auto_increment primary key,
                        pName varchar(25),
                        pPrice int
);
create table OrderDetail(
                            oID int,
                            pID int,
                            odQTY int,
                            foreign key (oID) references aOrder (oID),
                            foreign key (pID) references Product (pID)
);
insert into Customer (Name, cAge) VALUE ('Minh Quan', 10);
insert into Customer (Name, cAge) VALUE ('Ngoc Oanh', 20);
insert into Customer (Name, cAge) VALUE ('Hong Ha', 50);

insert into aOrder (cID, oDate, oTotalPrice) VALUE (1, '2006/03/21 12:00:00', null);
insert into aOrder (cID, oDate, oTotalPrice) VALUE (2, '2006/03/23 12:00:00', null);
insert into aOrder (cID, oDate, oTotalPrice) VALUE (1, '2006/03/16 12:00:00', null);

insert into Product (pName, pPrice) VALUE ('May giat', 3);
insert into Product (pName, pPrice) VALUE ('Tu lanh', 5);
insert into Product (pName, pPrice) VALUE ('Dieu hoa', 7);
insert into Product (pName, pPrice) VALUE ('Quat', 1);
insert into Product (pName, pPrice) VALUE ('Bep dien', 2);

insert into OrderDetail (oID, pID, odQTY) VALUE (1,1,3);
insert into OrderDetail (oID, pID, odQTY) VALUE (1,3,7);
insert into OrderDetail (oID, pID, odQTY) VALUE (1,4,2);
insert into OrderDetail (oID, pID, odQTY) VALUE (2,1,1);
insert into OrderDetail (oID, pID, odQTY) VALUE (3,1,8);
insert into OrderDetail (oID, pID, odQTY) VALUE (2,5,4);
insert into OrderDetail (oID, pID, odQTY) VALUE (2,3,3);


select a.oID, a.oDate, a.oTotalPrice from aOrder a;
select aO.oID, c.cID, c.Name from Customer c left join aOrder aO on c.cID = aO.cID where c.cID = 3;
select aO.oID, aO.oDate, sum(od.odQty*p.pPrice) 'Tong hoa don'  from aOrder aO join OrderDetail OD on aO.oID = OD.oID join Product P on P.pID = OD.pID group by OD.oID;
