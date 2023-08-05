import { PrismaClient } from "@prisma/client";

async function main() {
  const client = new PrismaClient();

  const res = await client.user.upsert({
    where: {
      email: "foobarbaz@gmail.com",
    },
    create: {
      email: "foobarbaz@gmail.com",
      name: "Teague Stockwell",
      profileSrc: "https://lh3.googleusercontent.com/a/foobarbaz",
    },
    update: {
      email: "foobarbaz@gmail.com",
      name: "Teague Stockwell",
      profileSrc: "https://lh3.googleusercontent.com/a/foobarbaz",
    },
  });

  console.table(res);

  await client.$disconnect();
}

main()
  .then(() => {
    process.exit(0)
  })
  .catch((e) => {
    console.error(e)
    process.exit(1)
  });
