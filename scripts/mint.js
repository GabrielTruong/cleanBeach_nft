// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const TiketEvent = await hre.ethers.getContractFactory("tiketEvent");
  const tiketEvent = await TiketEvent.attach("YOUR-SMART-CONTRACT-ADDRESS");

  await tiketEvent.mintNFT("0x50DbF9a279fB93618042ca419a7A7946432CB950", "https://gateway.pinata.cloud/ipfs/QmbZrkgjeiMh8WJ2xM9pk8q8QQtrmuiPsgjehvKDbZmT3V");

  console.log(
    ` deployed to ${tiketEvent.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});