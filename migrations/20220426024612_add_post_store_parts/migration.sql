/*
  Warnings:

  - You are about to drop the `_PartToPost` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `qty` to the `StorePart` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `StorePart` ADD COLUMN `qty` INTEGER UNSIGNED NOT NULL;

-- DropTable
DROP TABLE `_PartToPost`;

-- CreateTable
CREATE TABLE `_PostToStorePart` (
    `A` VARCHAR(32) NOT NULL,
    `B` VARCHAR(32) NOT NULL,

    UNIQUE INDEX `_PostToStorePart_AB_unique`(`A`, `B`),
    INDEX `_PostToStorePart_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
