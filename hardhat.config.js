require("@nomicfoundation/hardhat-toolbox");
import * as dotenv from "dotenv";
dotenv.config();


module.exports = {
  solidity: "0.8.17",
  networks: {
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/xPACxJYzW3ovyVZS_NMuOHO-BZaKcF2d",
      accounts:[process.env.SMART_WALLET],
    },
  },
};