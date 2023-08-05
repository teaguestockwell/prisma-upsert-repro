/*
  Warnings:

  - You are about to alter the column `resource` on the `RateLimit` table. The data in that column could be lost. The data in that column will be cast from `Enum("RateLimit_resource")` to `UnsignedTinyInt`.
  - You are about to drop the `Msg` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `RateLimit` MODIFY `resource` TINYINT UNSIGNED NOT NULL;

-- DropTable
DROP TABLE `Msg`;
