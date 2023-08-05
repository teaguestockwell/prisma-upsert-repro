/*
  Warnings:

  - You are about to drop the column `partid` on the `Pic` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[partId]` on the table `Pic` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `Pic_partid_key` ON `Pic`;

-- AlterTable
ALTER TABLE `Pic` DROP COLUMN `partid`,
    ADD COLUMN `partId` VARCHAR(32) NULL;

-- CreateIndex
CREATE INDEX `Comment_email_postId_parentCommentId_idx` ON `Comment`(`email`, `postId`, `parentCommentId`);

-- CreateIndex
CREATE INDEX `Msg_toEmail_email_idx` ON `Msg`(`toEmail`, `email`);

-- CreateIndex
CREATE INDEX `Part_topicId_partCategoryId_idx` ON `Part`(`topicId`, `partCategoryId`);

-- CreateIndex
CREATE INDEX `PartCategory_topicId_topicName_idx` ON `PartCategory`(`topicId`, `topicName`);

-- CreateIndex
CREATE UNIQUE INDEX `Pic_partId_key` ON `Pic`(`partId`);

-- CreateIndex
CREATE INDEX `Pic_email_postId_partId_topicId_idx` ON `Pic`(`email`, `postId`, `partId`, `topicId`);

-- CreateIndex
CREATE INDEX `Post_email_topicId_idx` ON `Post`(`email`, `topicId`);

-- CreateIndex
CREATE INDEX `RateLimit_email_resource_idx` ON `RateLimit`(`email`, `resource`);

-- CreateIndex
CREATE INDEX `Topic_name_idx` ON `Topic`(`name`);

-- CreateIndex
CREATE INDEX `User_name_idx` ON `User`(`name`);
