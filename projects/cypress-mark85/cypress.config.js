const path = require("path");
const { defineConfig } = require("cypress");
const { MongoClient } = require("mongodb");
const dotenv = require("dotenv");

// Reuse the same MongoDB settings used by the Mark85 API.
dotenv.config({ path: path.resolve(__dirname, "../../apps/mark85/api/.env") });

async function withUsersCollection(callback) {
  const uri = process.env.MONGO_URI;
  if (!uri) {
    throw new Error(
      "MONGO_URI não está definido. Configure a conexão do MongoDB nas variáveis de ambiente ou no .env da API."
    );
  }

  const client = new MongoClient(uri);
  try {
    await client.connect();
    const databaseName = process.env.MONGO_DATABASE || "mark85_db";
    return await callback(client.db(databaseName).collection("users"));
  } finally {
    await client.close();
  }
}

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on) {
      on("task", {
        async clearUsers() {
          const result = await withUsersCollection((users) => users.deleteMany({}));
          return { deletedCount: result.deletedCount };
        },

        async insertUser({ name, email, password } = {}) {
          if (![name, email, password].every((value) => typeof value === "string" && value.trim())) {
            throw new Error("Informe nome, email e senha como textos não vazios.");
          }

          const result = await withUsersCollection((users) =>
            users.insertOne({ name, email, password })
          );
          return { insertedId: result.insertedId.toString() };
        },
      });
    },
  },
});
