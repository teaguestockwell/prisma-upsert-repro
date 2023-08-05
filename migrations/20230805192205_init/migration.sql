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

-- CreateTable
CREATE TABLE `Post` (
    `postId` VARCHAR(32) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `topicId` VARCHAR(32) NOT NULL,
    `topicName` VARCHAR(32) NOT NULL,
    `userId` VARCHAR(32) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `numLikes` INTEGER NOT NULL DEFAULT 0,
    `html` TEXT NOT NULL,
    `views` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `storePartsQty` JSON NULL,

    INDEX `Post_email_idx`(`email`),
    INDEX `Post_userId_idx`(`userId`),
    INDEX `Post_topicId_idx`(`topicId`),
    INDEX `Post_topicName_idx`(`topicName`),
    PRIMARY KEY (`postId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comment` (
    `commentId` VARCHAR(32) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `postId` VARCHAR(32) NOT NULL,
    `parentCommentId` VARCHAR(32) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` DATETIME(0) NOT NULL,
    `numLikes` INTEGER NOT NULL DEFAULT 0,
    `text` TEXT NOT NULL,

    INDEX `Comment_email_idx`(`email`),
    INDEX `Comment_postId_idx`(`postId`),
    INDEX `Comment_parentCommentId_idx`(`parentCommentId`),
    INDEX `Comment_numLikes_idx`(`numLikes` DESC),
    INDEX `Comment_createdAt_idx`(`createdAt` DESC),
    PRIMARY KEY (`commentId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pic` (
    `picId` VARCHAR(32) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `postId` VARCHAR(32) NULL,
    `partId` VARCHAR(32) NULL,
    `topicId` VARCHAR(32) NULL,
    `s3Key` VARCHAR(128) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `Pic_partId_key`(`partId`),
    UNIQUE INDEX `Pic_topicId_key`(`topicId`),
    INDEX `Pic_email_idx`(`email`),
    INDEX `Pic_postId_idx`(`postId`),
    INDEX `Pic_partId_idx`(`partId`),
    INDEX `Pic_topicId_idx`(`topicId`),
    PRIMARY KEY (`picId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PicJob` (
    `s3Key` VARCHAR(128) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `PicJob_createdAt_idx`(`createdAt`),
    PRIMARY KEY (`s3Key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RateLimit` (
    `rateLimitId` VARCHAR(32) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `resource` TINYINT UNSIGNED NOT NULL,

    INDEX `RateLimit_email_resource_idx`(`email`, `resource`),
    INDEX `RateLimit_createdAt_idx`(`createdAt`),
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
    INDEX `Topic_name_idx`(`name`),
    UNIQUE INDEX `Topic_topicId_name_key`(`topicId`, `name`),
    PRIMARY KEY (`topicId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PartCategory` (
    `partCategoryId` VARCHAR(32) NOT NULL,
    `topicId` VARCHAR(32) NOT NULL,
    `topicName` VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    `about` VARCHAR(256) NOT NULL,

    INDEX `PartCategory_topicId_idx`(`topicId`),
    INDEX `PartCategory_topicName_idx`(`topicName`),
    UNIQUE INDEX `PartCategory_name_topicId_key`(`name`, `topicId`),
    PRIMARY KEY (`partCategoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Part` (
    `partId` VARCHAR(32) NOT NULL,
    `topicId` VARCHAR(32) NOT NULL,
    `partCategoryId` VARCHAR(32) NOT NULL,
    `numPosts` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `name` VARCHAR(256) NOT NULL,
    `description` TEXT NULL,
    `src` TEXT NULL,

    INDEX `Part_topicId_idx`(`topicId`),
    INDEX `Part_partCategoryId_idx`(`partCategoryId`),
    INDEX `Part_partCategoryId_name_numPosts_idx`(`partCategoryId`, `name` ASC, `numPosts` DESC),
    UNIQUE INDEX `Part_name_partCategoryId_key`(`name`, `partCategoryId`),
    PRIMARY KEY (`partId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Store` (
    `storeId` VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `Store_name_key`(`name`),
    INDEX `Store_name_idx`(`name`),
    PRIMARY KEY (`storeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StorePart` (
    `storePartId` VARCHAR(32) NOT NULL,
    `partId` VARCHAR(32) NOT NULL,
    `storeId` VARCHAR(32) NOT NULL,
    `price` VARCHAR(32) NOT NULL,
    `url` VARCHAR(512) NOT NULL,
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `StorePart_partId_idx`(`partId`),
    INDEX `StorePart_storeId_idx`(`storeId`),
    INDEX `StorePart_url_idx`(`url`),
    PRIMARY KEY (`storePartId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_followingUsers` (
    `A` VARCHAR(256) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_followingUsers_AB_unique`(`A`, `B`),
    INDEX `_followingUsers_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_likedPosts` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_likedPosts_AB_unique`(`A`, `B`),
    INDEX `_likedPosts_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_savedPosts` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_savedPosts_AB_unique`(`A`, `B`),
    INDEX `_savedPosts_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_PostToStorePart` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `_PostToStorePart_AB_unique`(`A`, `B`),
    INDEX `_PostToStorePart_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_likedComments` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_likedComments_AB_unique`(`A`, `B`),
    INDEX `_likedComments_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_savedComments` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_savedComments_AB_unique`(`A`, `B`),
    INDEX `_savedComments_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_moderatedTopics` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_moderatedTopics_AB_unique`(`A`, `B`),
    INDEX `_moderatedTopics_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_topics` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(256) NOT NULL,

    UNIQUE INDEX `_topics_AB_unique`(`A`, `B`),
    INDEX `_topics_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
