const MongoClient = require("mongodb").MongoClient;
const util = require('util');

const interval = (process.env.LOG_INTERVAL || 10) * 1000;
const host = process.env.MONGO_HOST || "localhost";
const port = process.env.MONGO_PORT || "27017";
const dbName = process.env.MONGO_DB || "admin";
const user = process.env.MONGO_USER || "root";
const pass = process.env.MONGO_PASS || "root";
const limit =  process.env.LIMIT || "10";

let mongoClient = null;
const getClient = async () => {
  if (!mongoClient) {
    mongoClient = await MongoClient.connect(
      `mongodb://${user && pass ? `${user}:${pass}@` : ""}${host}:${port}`
    );
  }

  return mongoClient;
};

// create logging function
const log_stdout = process.stdout;

const log = data => {
  const dataFormatted = JSON.stringify(data)

  log_stdout.write(util.format(dataFormatted) + '\n')
};

setInterval(function () {
  getClient()
    .then(async function (client) {
      const db = client.db(dbName);

      const { inprog = [], ok = 0 } = await db.command({
        currentOp: 1,
        $all: false,
        active: true,
        secs_running: { $gt: Number(limit) },
      });

      if (!ok) {
        log("Failed to run mongo command");
      }

      for (item of inprog) {
        log(JSON.parse(JSON.stringify(item)));
      }
    })
    .catch((err) => {
      log(`Failed to execute mongo query, ERROR: ${err}`, err);
    });
}, interval);
