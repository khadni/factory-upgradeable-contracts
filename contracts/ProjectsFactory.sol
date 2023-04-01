//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "./Project.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract ProjectsFactory {

   address public projectImplementation;

   TransparentUpgradeableProxy[] public projectsArray;

    constructor() {
        projectImplementation = address(new Project());
    }

    function createNewProject(string memory _projectName) public {
        TransparentUpgradeableProxy projectProxy = new TransparentUpgradeableProxy(
            projectImplementation,
            msg.sender, // The admin who can upgrade the proxy
            abi.encodeWithSignature("initialize(string,address)", _projectName, address(this))
        );
        projectsArray.push(projectProxy);
    }

    function upgradeProject(uint256 projectIndex, address newImplementation) public {
        require(projectIndex < projectsArray.length, "Invalid project index");

        TransparentUpgradeableProxy projectProxy = projectsArray[projectIndex];
        require(msg.sender == projectProxy.admin(), "Only admin can upgrade");

        projectProxy.upgradeTo(newImplementation);
    }

}