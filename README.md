
# Datenbase and Web Technique Practical Task – Summer Semester 2018

A web application which provides a common interface for searching menu or dishes of different 
restaurants. There are different restaurants with various types of menus and dishes. 
So it is not easy to pick up desire menu at low cost by searching huge amount of website. 
Using this web application a user get a single point where s/he can search for dishes and get 
result with dish name, price, ingredients and restaurant details.  

## Getting Started
The following instructions will get you a copy of the project and running on your machine for 
development.

### Prerequisites

Apache 2.1.12, PHP 5.6, MySQL 5.6

### Installing And Deployment

Step1. Install composer.

Step2. clone or downlaod 3 folders in the server root directory this please don't change the folder name.

Step3. 
   	1. Go to the folder "restaurantapi" from the command prompt/line and run the command "composer update".
   	2. Go to the folder "restaurant" from the command prompt/line and run the command "composer update".

Step4. open .env file from "restaurantapi" and "restaurant"folder. Configure your database connection.

Step5. now you must import the restaurant.sql file which reside in the "restaurantapi/database" folder.

Step6. open pdftotext/index.php file and configure database.

Step7. Activate CURL libray from php.ini file.

Step8. increase ThreadStackSize to 8388608 in "mpm_winnt_module" section in the file "httpd-mpm.conf" if it is windows machine.

Step9. Now go inside the folder "restaurantapi" and run the command "php artisan serve --port=8000".

Step10. Now go inside the folder "restaurant" and run the command "php artisan serve --port=8080".

## Authors

* **MD ABU YUSUF** - [mayusuf](https://github.com/mayusuf)
