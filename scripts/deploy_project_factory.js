const hre = require("hardhat");

async function main() {
  const ProjectFactory = await hre.ethers.getContractFactory("ProjectsFactory");
  const projectFactory = await ProjectFactory.deploy();

  await projectFactory.deployed();

  console.log(`ProjectFactory contract deployed to ${projectFactory.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
