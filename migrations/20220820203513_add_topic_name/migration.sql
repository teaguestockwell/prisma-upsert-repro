/*
  Warnings:

  - A unique constraint covering the columns `[topicId,name]` on the table `Topic` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `about` to the `PartCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `topicName` to the `PartCategory` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `PartCategory` ADD COLUMN `about` VARCHAR(256) NOT NULL,
    ADD COLUMN `topicName` VARCHAR(32) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Topic_topicId_name_key` ON `Topic`(`topicId`, `name`);
