Định nghĩa Stored Procedures:

USE demo;

DELIMITER $$
create procedure select_user()
begin
	select * from users;
end$$
DELIMITER ;

DELIMITER $$
create procedure edit_user(in user_id int, in user_name varchar(120), in user_email varchar(220), in user_country varchar(120))
begin
	update users
    set name = user_name, email = user_email, country = user_country
    where id = user_id;
end$$
DELIMITER ;

DELIMITER $$
create procedure delete_user(in user_id int)
begin
	delete from users
    where id = user_id;
end$$
DELIMITER ;

Các bước chạy chương trình:
1. Build qua Maven bằng lệnh mvn clean package 
2. Add deployment -> Chọn File: user-management.war
3. Chạy http://localhost:8080/user-management/users trên server của Tomcat