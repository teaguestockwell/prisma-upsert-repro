-- DropIndex
DROP INDEX `StorePart_url_key` ON `StorePart`;

-- CreateIndex
CREATE INDEX `StorePart_url_idx` ON `StorePart`(`url`);
