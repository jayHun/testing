drop table tb_qrcode cascade constraint;
drop table tb_qrcode cascade constraint;
drop table tb_code;
commit;


create table tb_member(
member_email	varchar2(50),
member_pw		varchar2(30) not null,
member_name		varchar2(10) not null,
member_phone	varchar2(25),
member_type		varchar2(10) not null,
member_wallet	varchar2(200) not null,
constraint pk_member primary key(member_email));


create table tb_qrcode(
qrcode_url		varchar2(200) not null,
member_email	varchar2(50) not null,
img_file_name	varchar2(100),
constraint fk_member_email foreign key(member_email) references tb_member(member_email));
	

create table tb_code(
code_type	varchar2(30),
code_code	varchar2(30),
code_name	varchar2(30));


insert into tb_member values('aaa@aaa', 'aaa', 'Han', '01022223333', 'QUR', 'InvoiceMakerHash');
insert into tb_member values('bbb@bbb', 'bbb', 'Lee', '01044445555', 'NUR', 'NormalUserHash');
insert into tb_member values('ccc@ccc', 'ccc', 'Kan', '01066667777', 'DUR', 'DeliveryManHash');


insert into tb_code values('INFO_TYPE', 'PRI', 'PrivateInfo');
insert into tb_code values('INFO_TYPE', 'MED', 'MedicalInfo');
insert into tb_code values('INFO_TYPE', 'DEL', 'DeliveryInfo');
insert into tb_code values('MEMBER_TYPE', 'QUR', 'InvoiceMaker');
insert into tb_code values('MEMBER_TYPE', 'NUR', 'NormalUser');
insert into tb_code values('MEMBER_TYPE', 'DUR', 'DeliveryMan');


commit;