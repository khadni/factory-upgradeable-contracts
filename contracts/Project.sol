// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Project is Initializable {

    address public owner;
    string public projectName;

    function initialize(string memory _projectName, address _owner) public payable initializer {
        projectName = _projectName;
        owner = _owner;
    }

    function setProjectName(string memory _projectName) public {
        projectName = _projectName;
    }
    
}