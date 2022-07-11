const main = async () => {
  const transfersFactory = await hre.ethers.getContractFactory("Transfer");
  const transfersContract = await transfersFactory.deploy();

  await transfersContract.deployed();

  console.log("Transfers address: ", transfersContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();