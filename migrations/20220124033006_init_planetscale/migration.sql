-- CreateTable
CREATE TABLE `User` (
    `email` VARCHAR(256) NOT NULL,
    `userId` VARCHAR(64) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `profileSrc` VARCHAR(128) NULL,
    `name` VARCHAR(128) NOT NULL,
    `profilePicS3Key` VARCHAR(128) NULL,
    `about` VARCHAR(256) NULL,
    `profileViews` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `postViews` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `numFollowers` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    UNIQUE INDEX `User_userId_key`(`userId`),
    PRIMARY KEY (`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Post` (
    `postId` VARCHAR(32) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `numLikes` INTEGER NOT NULL DEFAULT 0,
    `html` TEXT NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `views` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `topicId` VARCHAR(32) NOT NULL,

    PRIMARY KEY (`postId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comment` (
    `commentId` VARCHAR(32) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `parentCommentId` VARCHAR(32) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `postId` VARCHAR(32) NOT NULL,
    `numLikes` INTEGER NOT NULL DEFAULT 0,
    `text` TEXT NOT NULL,

    PRIMARY KEY (`commentId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Msg` (
    `msgId` VARCHAR(32) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `readAt` DATETIME(0) NULL,
    `toEmail` VARCHAR(256) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `body` TEXT NOT NULL,

    PRIMARY KEY (`msgId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pic` (
    `picId` VARCHAR(32) NOT NULL,
    `s3Key` VARCHAR(128) NOT NULL,
    `isMain` BOOLEAN NULL DEFAULT false,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `postId` VARCHAR(32) NULL,
    `email` VARCHAR(256) NOT NULL,
    `partid` VARCHAR(32) NULL,
    `topicId` VARCHAR(32) NULL,

    UNIQUE INDEX `Pic_partid_key`(`partid`),
    UNIQUE INDEX `Pic_topicId_key`(`topicId`),
    PRIMARY KEY (`picId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PicJob` (
    `s3Key` VARCHAR(128) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`s3Key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RateLimit` (
    `rateLimitId` VARCHAR(32) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `resource` ENUM('Pic', 'Msg', 'Comment', 'Post', 'Part', 'PartCategory', 'Store', 'StorePart', 'Topic') NOT NULL,
    `email` VARCHAR(256) NOT NULL,

    PRIMARY KEY (`rateLimitId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Topic` (
    `topicId` VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `about` TEXT NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `followerCount` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `views` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    UNIQUE INDEX `Topic_name_key`(`name`),
    PRIMARY KEY (`topicId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PartCategory` (
    `partCategoryId` VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `topicId` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `PartCategory_name_topicId_key`(`name`, `topicId`),
    PRIMARY KEY (`partCategoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Part` (
    `partId` VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `description` TEXT NULL,
    `topicId` VARCHAR(32) NOT NULL,
    `partCategoryId` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `Part_name_partCategoryId_key`(`name`, `partCategoryId`),
    PRIMARY KEY (`partId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Store` (
    `storeId` VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,

    PRIMARY KEY (`storeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StorePart` (
    `storePartId` VARCHAR(32) NOT NULL,
    `price` DOUBLE NOT NULL,
    `url` VARCHAR(512) NOT NULL,
    `storeId` VARCHAR(32) NOT NULL,
    `partId` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `StorePart_partId_storeId_key`(`partId`, `storeId`),
    PRIMARY KEY (`storePartId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_likedComments` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_likedComments_AB_unique`(`A`, `B`),
    INDEX `_likedComments_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_likedPosts` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_likedPosts_AB_unique`(`A`, `B`),
    INDEX `_likedPosts_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_savedComments` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_savedComments_AB_unique`(`A`, `B`),
    INDEX `_savedComments_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_savedPosts` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_savedPosts_AB_unique`(`A`, `B`),
    INDEX `_savedPosts_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_topics` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_topics_AB_unique`(`A`, `B`),
    INDEX `_topics_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_followingUsers` (
    `A` VARCHAR(256) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_followingUsers_AB_unique`(`A`, `B`),
    INDEX `_followingUsers_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_moderatedTopics` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_moderatedTopics_AB_unique`(`A`, `B`),
    INDEX `_moderatedTopics_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PartToPost` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `_PartToPost_AB_unique`(`A`, `B`),
    INDEX `_PartToPost_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
