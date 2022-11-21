require("@nomicfoundation/hardhat-toolbox");


module.exports = {
  solidity: "0.8.17",
  networks: {
    mumbai: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/xPACxJYzW3ovyVZS_NMuOHO-BZaKcF2d",
      accounts:["2fd8cbfd079c87af9457b217b0cdeab4c09b48453688126e4c46850acf1ac8df"],
    },
  },
};