/*
  Warnings:

  - A unique constraint covering the columns `[email,userId]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `Post` ADD COLUMN `topicName` VARCHAR(32) NOT NULL DEFAULT '',
    ADD COLUMN `userId` VARCHAR(32) NOT NULL DEFAULT '';

-- CreateIndex
CREATE INDEX `Post_userId_idx` ON `Post`(`userId`);

-- CreateIndex
CREATE INDEX `Post_topicName_idx` ON `Post`(`topicName`);

-- CreateIndex
CREATE UNIQUE INDEX `User_email_userId_key` ON `User`(`email`, `userId`);
