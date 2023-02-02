-- CREATE DATABASE `synthworld`;

  DROP TABLE IF EXISTS `cart_products`;
  DROP TABLE IF EXISTS `product_category`;
  DROP TABLE IF EXISTS `orders`;
  DROP TABLE IF EXISTS `users`;
  DROP TABLE IF EXISTS `products`;
  DROP TABLE IF EXISTS `brands`;
  DROP TABLE IF EXISTS `categories`;
  


CREATE TABLE `synthworld`.`users`
(
 `id`        INT NOT NULL AUTO_INCREMENT ,
 `first_name` VARCHAR(100) NOT NULL ,
 `last_name` VARCHAR(100) NOT NULL ,
 `email`     VARCHAR(100) NOT NULL ,
 `password`  VARCHAR(100) NOT NULL ,
 `image`     VARCHAR(100) DEFAULT 'defaultAvatar.png' ,
 `is_admin`   TINYINT DEFAULT 0 ,
 `created_at` TIMESTAMP DEFAULT (current_date()),
 `updated_at` TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`)
);


CREATE TABLE `synthworld`.`categories`
(
 `id`   INT NOT NULL AUTO_INCREMENT ,
 `name` varchar(45) NOT NULL ,
 `created_at` TIMESTAMP DEFAULT (current_date()),
 `updated_at` TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`)
);





CREATE TABLE `synthworld`.`brands`
(
 `id`   INT NOT NULL AUTO_INCREMENT ,
 `name` VARCHAR(45) NOT NULL ,
 `created_at` TIMESTAMP DEFAULT (current_date()),
 `updated_at` TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`)
);


-- VER DEFAULT

CREATE TABLE `synthworld`.`products`
(
 `id`                  INT NOT NULL AUTO_INCREMENT ,
 `name`                VARCHAR(100) NOT NULL ,
 `brand_id`            INT NULL ,
 `price`               DECIMAL(10, 2) NOT NULL ,
 `discount`            decimal(4, 2) DEFAULT 0 ,
 `image`               VARCHAR(100) NOT NULL ,
 `description`         TEXT NOT NULL ,
 `extra_info`          TEXT NULL ,
 `is_active`          TINYINT NOT NULL,
 `created_at` 		   TIMESTAMP DEFAULT (current_date()),
 `updated_at`          TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`),
KEY `brand` (`brand_id`),
CONSTRAINT `brand` FOREIGN KEY `brand` (`brand_id`) REFERENCES `Synthworld`.`brands` (`id`)
);


CREATE TABLE `synthworld`.`product_category`
(
 `id`         INT NOT NULL AUTO_INCREMENT ,
 `product_id` INT NOT NULL ,
 `category_id` INT NOT NULL ,
 `created_at` TIMESTAMP DEFAULT (current_date()),
 `updated_at` TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`),
KEY `productC` (`product_id`),
CONSTRAINT `productC` FOREIGN KEY `productC` (`product_id`) REFERENCES `Synthworld`.`products` (`id`),
KEY `category` (`category_id`),
CONSTRAINT `category` FOREIGN KEY `category` (`category_id`) REFERENCES `Synthworld`.`categories` (`id`)
);




CREATE TABLE `synthworld`.`orders`
(
 `id`      INT NOT NULL AUTO_INCREMENT ,
 `user_id` INT NOT NULL ,
 `total`   DECIMAL(10, 2) NOT NULL ,
 `checkout` TINYINT DEFAULT 0,
 `checkout_date` DATE NULL ,
 `created_at` TIMESTAMP DEFAULT (current_date()),
 `updated_at` TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`),
KEY `user` (`user_id`),
CONSTRAINT `user` FOREIGN KEY `user` (`user_id`) REFERENCES `Synthworld`.`users` (`id`)
);







CREATE TABLE `synthworld`.`cart_products`
(
 `id`         INT NOT NULL AUTO_INCREMENT ,
 `product_id` INT NOT NULL ,
 `order_id`   INT NOT NULL ,
 `quantity`   INT NOT NULL ,
 `created_at` TIMESTAMP DEFAULT (current_date()),
 `updated_at` TIMESTAMP DEFAULT (current_date()),

PRIMARY KEY (`id`),
KEY `product` (`product_id`),
CONSTRAINT `product` FOREIGN KEY `product` (`product_id`) REFERENCES `Synthworld`.`products` (`id`),
KEY `order` (`order_id`),
CONSTRAINT `order` FOREIGN KEY `order` (`order_id`) REFERENCES `Synthworld`.`orders` (`id`)
);






