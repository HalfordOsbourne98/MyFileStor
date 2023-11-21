// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedFileStorage {
    mapping(address => string[]) public userFiles;

    event FileUploaded(address indexed uploader, string indexed fileName, string fileContent);

    modifier validFileName(string memory _fileName) {
        require(bytes(_fileName).length > 0, "File name cannot be empty");
        _;
    }
function uploadFile(string memory _fileName, string memory _fileContent) external validFileName(_fileName) {
        userFiles[msg.sender].push(_fileName);
        emit FileUploaded(msg.sender, _fileName, _fileContent);
    }

  
}
