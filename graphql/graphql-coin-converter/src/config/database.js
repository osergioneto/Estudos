const dotenv = require("dotenv");

try {
    dotenv.config();
} catch (err) {
    console.log(err);
}

module.exports = {
    "development": {
        "url": process.env.DATABASE_URL
    },
    "test": {
        "url": process.env.DATABASE_URL_TEST
    },
    "production": {
        "url": process.env.DATABASE_URL
    }
}