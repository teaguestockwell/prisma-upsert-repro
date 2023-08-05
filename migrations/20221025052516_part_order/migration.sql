-- CreateIndex
CREATE INDEX `Part_partCategoryId_name_numPosts_idx` ON `Part`(`partCategoryId`, `name` ASC, `numPosts` DESC);
