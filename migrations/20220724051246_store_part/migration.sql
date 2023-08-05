/*
  Warnings:

  - You are about to drop the column `qty` on the `StorePart` table. All the data in the column will be lost.
  - You are about to alter the column `price` on the `StorePart` table. The data in that column could be lost. The data in that column will be cast from `Double` to `VarChar(32)`.
  - A unique constraint covering the columns `[name]` on the table `Store` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[url]` on the table `StorePart` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `StorePart` DROP COLUMN `qty`,
    MODIFY `price` VARCHAR(32) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Store_name_key` ON `Store`(`name`);

-- CreateIndex
CREATE UNIQUE INDEX `StorePart_url_key` ON `StorePart`(`url`);
