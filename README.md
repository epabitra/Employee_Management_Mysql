
# Employee Management System

It is simply a Web Application used to demonstrate the Employee Management System.

#### If you want to try this application by your self then don't worry i will explain all the steps you need to run this application on your Laptop / PC.

# Basic Installation Requirements
- Java 
- Eclipse
- My SQL
- Tomcat 10
## Steps to use this application

**Step 1** - Clone my project using git clone

```bash
 git clone https://github.com/epabitra3/Employee_Management_Mysql.git
```
**Step 2** - Paste this application inside your eclipse workspace

**Step 3** - Open you MySQL Workbench and create a table using below code

```bash
CREATE TABLE `employee` (
   `EMPLOYEEID` int NOT NULL AUTO_INCREMENT,
   `NAME` varchar(100) NOT NULL,
   `SALARY` int NOT NULL,
   `BIRTHDATE` date NOT NULL,
   `GENDER` int DEFAULT NULL,
   `ADDRESS` varchar(200) NOT NULL,
   PRIMARY KEY (`EMPLOYEEID`)
 ) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

```
**Step 4** - Now Open this project inside Eclipse

**Step 5** - Open   `web.xml` file in the below path
```bash
src/main/webapp/WEB-INF/web.xml
```
**Step 6** - Change the below 3 configurations with your configuration
#
![App Screenshot](https://i.postimg.cc/sgZ6DQGm/Screenshot-36.png)

**Step 7** - Now Right click on this project and choose Run As / Run On Server

**Step 8** - Now you are able to enjoy this application

#### Thank you
