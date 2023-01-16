CREATE DATABASE `synthworld`;

CREATE TABLE `synthworld`.`user_categories`
(
 `id`   INT NOT NULL AUTO_INCREMENT ,
 `name` VARCHAR(45) NOT NULL ,

PRIMARY KEY (`id`)
);



CREATE TABLE `synthworld`.`users`
(
 `id`               INT NOT NULL AUTO_INCREMENT ,
 `name`             VARCHAR(45) NOT NULL ,
 `user_category_id` INT NOT NULL ,
 `last_name`        VARCHAR(45) NULL ,
 `email`            VARCHAR(45) NOT NULL ,
 `password`         VARCHAR(100) NOT NULL ,
 `image`            VARCHAR(100) NULL ,

PRIMARY KEY (`id`),
KEY `user_category` (`user_category_id`),
CONSTRAINT `user_category` FOREIGN KEY `user_category` (`user_category_id`) REFERENCES `Synthworld`.`user_categories` (`id`)
);





CREATE TABLE `synthworld`.`product_categories`
(
 `id`   int NOT NULL AUTO_INCREMENT ,
 `name` varchar(45) NOT NULL ,

PRIMARY KEY (`id`)
);





CREATE TABLE `synthworld`.`brands`
(
 `id`   INT NOT NULL AUTO_INCREMENT ,
 `name` VARCHAR(45) NOT NULL ,

PRIMARY KEY (`id`)
);


-- VER DEFAULT

CREATE TABLE `synthworld`.`products`
(
 `id`                  INT NOT NULL AUTO_INCREMENT ,
 `name`                VARCHAR(100) NOT NULL ,
 `brand_id`            INT NULL ,
 `product_category_id` INT NOT NULL ,
 `price`               DECIMAL(10, 2) NOT NULL ,
 `discount`            decimal(4, 2) NULL ,
 `image`               VARCHAR(100) NOT NULL ,
 `description`         TEXT NULL ,
 `extra_info`          TEXT NULL ,
 `availability`        BINARY NOT NULL,

PRIMARY KEY (`id`),
KEY `product_category` (`product_category_id`),
CONSTRAINT `product_category` FOREIGN KEY `product_category` (`product_category_id`) REFERENCES `Synthworld`.`product_categories` (`id`),
KEY `brand` (`brand_id`),
CONSTRAINT `brand` FOREIGN KEY `brand` (`brand_id`) REFERENCES `Synthworld`.`brands` (`id`)
);






CREATE TABLE `synthworld`.`orders`
(
 `id`      INT NOT NULL AUTO_INCREMENT ,
 `user_id` INT NOT NULL ,
 `date`    DATE NOT NULL ,
 `total`   INT NOT NULL ,

PRIMARY KEY (`id`),
KEY `user` (`user_id`),
CONSTRAINT `user` FOREIGN KEY `user` (`user_id`) REFERENCES `Synthworld`.`users` (`id`)
);







CREATE TABLE `synthworld`.`order_products`
(
 `id`         INT NOT NULL AUTO_INCREMENT ,
 `product_id` INT NOT NULL ,
 `order_id`   INT NOT NULL ,
 `quantity`   INT NULL ,

PRIMARY KEY (`id`),
KEY `product` (`product_id`),
CONSTRAINT `product` FOREIGN KEY `product` (`product_id`) REFERENCES `Synthworld`.`products` (`id`),
KEY `FK_3` (`order_id`),
CONSTRAINT `FK_6` FOREIGN KEY `FK_3` (`order_id`) REFERENCES `Synthworld`.`orders` (`id`)
);






