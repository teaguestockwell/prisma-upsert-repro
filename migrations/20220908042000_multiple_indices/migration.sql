-- DropIndex
DROP INDEX `Comment_email_postId_parentCommentId_idx` ON `Comment`;

-- DropIndex
DROP INDEX `Msg_toEmail_email_idx` ON `Msg`;

-- DropIndex
DROP INDEX `Part_topicId_partCategoryId_idx` ON `Part`;

-- DropIndex
DROP INDEX `PartCategory_topicId_topicName_idx` ON `PartCategory`;

-- DropIndex
DROP INDEX `Pic_email_postId_partId_topicId_idx` ON `Pic`;

-- DropIndex
DROP INDEX `Post_email_topicId_idx` ON `Post`;

-- CreateIndex
CREATE INDEX `Comment_email_idx` ON `Comment`(`email`);

-- CreateIndex
CREATE INDEX `Comment_postId_idx` ON `Comment`(`postId`);

-- CreateIndex
CREATE INDEX `Comment_parentCommentId_idx` ON `Comment`(`parentCommentId`);

-- CreateIndex
CREATE INDEX `Comment_numLikes_idx` ON `Comment`(`numLikes` DESC);

-- CreateIndex
CREATE INDEX `Comment_createdAt_idx` ON `Comment`(`createdAt` DESC);

-- CreateIndex
CREATE INDEX `Msg_toEmail_idx` ON `Msg`(`toEmail`);

-- CreateIndex
CREATE INDEX `Msg_email_idx` ON `Msg`(`email`);

-- CreateIndex
CREATE INDEX `Part_topicId_idx` ON `Part`(`topicId`);

-- CreateIndex
CREATE INDEX `Part_partCategoryId_idx` ON `Part`(`partCategoryId`);

-- CreateIndex
CREATE INDEX `PartCategory_topicId_idx` ON `PartCategory`(`topicId`);

-- CreateIndex
CREATE INDEX `PartCategory_topicName_idx` ON `PartCategory`(`topicName`);

-- CreateIndex
CREATE INDEX `Pic_email_idx` ON `Pic`(`email`);

-- CreateIndex
CREATE INDEX `Pic_postId_idx` ON `Pic`(`postId`);

-- CreateIndex
CREATE INDEX `Pic_partId_idx` ON `Pic`(`partId`);

-- CreateIndex
CREATE INDEX `Pic_topicId_idx` ON `Pic`(`topicId`);

-- CreateIndex
CREATE INDEX `PicJob_createdAt_idx` ON `PicJob`(`createdAt`);

-- CreateIndex
CREATE INDEX `Post_email_idx` ON `Post`(`email`);

-- CreateIndex
CREATE INDEX `Post_topicId_idx` ON `Post`(`topicId`);

-- CreateIndex
CREATE INDEX `RateLimit_createdAt_idx` ON `RateLimit`(`createdAt`);

-- CreateIndex
CREATE INDEX `Store_name_idx` ON `Store`(`name`);

-- CreateIndex
CREATE INDEX `StorePart_partId_idx` ON `StorePart`(`partId`);

-- CreateIndex
CREATE INDEX `StorePart_storeId_idx` ON `StorePart`(`storeId`);

-- CreateIndex
CREATE INDEX `User_userId_idx` ON `User`(`userId`);
