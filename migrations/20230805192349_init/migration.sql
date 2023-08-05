-- CreateTable
CREATE TABLE `User` (
    `email` VARCHAR(256) NOT NULL,
    `userId` VARCHAR(64) NOT NULL,
    `name` VARCHAR(128) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `profileSrc` VARCHAR(128) NULL,
    `profilePicS3Key` VARCHAR(128) NULL,
    `about` VARCHAR(256) NULL,
    `profileViews` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `postViews` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `numFollowers` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    UNIQUE INDEX `User_userId_key`(`userId`),
    INDEX `User_name_idx`(`name`),
    INDEX `User_userId_idx`(`userId`),
    UNIQUE INDEX `User_email_userId_key`(`email`, `userId`),
    PRIMARY KEY (`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
