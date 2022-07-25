require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
   rinkeby: {
     url: "https://rinkeby.infura.io/v3/35114534932e4aa5a52bf9346c17234e", //Infura url with projectId
     accounts: ["d59e9a9e37f82491c4c4aaa8cd84e014d374366bfcaf7fa36d30b7f73e81f1b2"] // add the account that will deploy the contract (private key)
    },
  }
};
