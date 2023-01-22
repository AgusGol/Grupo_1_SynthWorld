-- CREATE DATABASE `synthworld`;


-- DROP TABLE IF EXISTS `order_products`;
-- DROP TABLE IF EXISTS `orders`;
-- DROP TABLE IF EXISTS `users`;


CREATE TABLE `Synthworld`.`users`
(
 `id`        INT NOT NULL AUTO_INCREMENT ,
 `first_name` VARCHAR(45) NOT NULL ,
 `last_name` VARCHAR(45) NULL ,
 `email`     VARCHAR(100) NOT NULL ,
 `password`  VARCHAR(100) NOT NULL ,
 `image`     VARCHAR(100) NULL ,
 `is_admin`   BINARY(1) NOT NULL ,
 `created_at` TIMESTAMP NOT NULL,

PRIMARY KEY (`id`)
);


CREATE TABLE `synthworld`.`categories`
(
 `id`   INT NOT NULL AUTO_INCREMENT ,
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
 `category_id`         INT NOT NULL ,
 `price`               DECIMAL(10, 2) NOT NULL ,
 `discount`            decimal(4, 2) NULL ,
 `image`               VARCHAR(100) NOT NULL ,
 `description`         TEXT NULL ,
 `extra_info`          TEXT NULL ,
 `availability`        BINARY NOT NULL,
 `created_at` 		   TIMESTAMP NOT NULL,

PRIMARY KEY (`id`),
KEY `category` (`category_id`),
CONSTRAINT `category` FOREIGN KEY `category` (`category_id`) REFERENCES `Synthworld`.`categories` (`id`),
KEY `brand` (`brand_id`),
CONSTRAINT `brand` FOREIGN KEY `brand` (`brand_id`) REFERENCES `Synthworld`.`brands` (`id`)
);






CREATE TABLE `synthworld`.`orders`
(
 `id`      INT NOT NULL AUTO_INCREMENT ,
 `user_id` INT NOT NULL ,
 `date`    DATE NOT NULL ,
 `total`   INT NOT NULL ,
 `checkout` BINARY NULL,
 `created_at` TIMESTAMP NOT NULL,
 `updated_at` TIMESTAMP NOT NULL,

PRIMARY KEY (`id`),
KEY `user` (`user_id`),
CONSTRAINT `user` FOREIGN KEY `user` (`user_id`) REFERENCES `Synthworld`.`users` (`id`)
);







CREATE TABLE `synthworld`.`cart`
(
 `id`         INT NOT NULL AUTO_INCREMENT ,
 `product_id` INT NOT NULL ,
 `order_id`   INT NOT NULL ,
 `quantity`   INT NULL ,
 `created_at` TIMESTAMP NOT NULL,

PRIMARY KEY (`id`),
KEY `product` (`product_id`),
CONSTRAINT `product` FOREIGN KEY `product` (`product_id`) REFERENCES `Synthworld`.`products` (`id`),
KEY `order` (`order_id`),
CONSTRAINT `order` FOREIGN KEY `order` (`order_id`) REFERENCES `Synthworld`.`orders` (`id`)
);






