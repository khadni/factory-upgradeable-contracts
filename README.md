# Upgradeable contracts - Decentralized Project Management Platform

This repository contains the smart contracts for a decentralized project management platform using Ethereum and Solidity. The main files are **`ProjectsFactory.sol`** and **`Project.sol`**.

## **Overview**

The platform allows users to create and manage projects using a factory pattern. Each project is deployed as an upgradeable proxy contract, which enables the platform to update the project logic without requiring the redeployment of existing projects.

## **Smart Contracts**

### **ProjectsFactory.sol**

The **`ProjectsFactory`** contract is responsible for deploying new project instances and managing upgrades to the underlying **`Project`** implementation. It utilizes the OpenZeppelin TransparentUpgradeableProxy pattern for creating and upgrading projects.

Key features:

- Creates new projects using the **`createNewProject`** function, which deploys a new **`TransparentUpgradeableProxy`** instance with the current **`projectImplementation`** as the underlying logic.
- Upgrades an existing project's implementation with the **`upgradeProject`** function, which can only be called by the project's admin.
- Stores a list of all projects in the **`projectsArray`**.

### **Project.sol**

The **`Project`** contract represents an individual project on the platform. It is an upgradeable contract using OpenZeppelin's **`Initializable`** contract to ensure proper initialization.

Key features:

- Initializes a new project with the **`initialize`** function, setting the project's name and owner.
- Updates the project's name with the **`setProjectName`** function, which can be called by any address.

## **Setup and Installation**

To set up and install the dependencies for this project, follow these steps:

1. Clone the repository to your local machine.
2. Run **`npm install`** in the project root directory to install the required packages, including **[OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)** and **[Hardhat](https://hardhat.org/)**.

## **Usage**

After setting up the project, you can use **[Hardhat](https://hardhat.org/)** to compile, deploy, and interact with the smart contracts.

- Compile the smart contracts by running **`npx hardhat compile`**.
- Deploy the smart contracts to a local development network with **`npx hardhat run --network localhost scripts/deploy_project_factory.js`**.
