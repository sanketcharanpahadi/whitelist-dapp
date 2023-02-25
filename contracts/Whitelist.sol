// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Whitelist {
    uint8 public maxWhitelistedAddress;
    mapping(address => bool) public whitelistedAddress;
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddress = _maxWhitelistedAddress;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddress[msg.sender],
            "Sender has already been whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddress,
            "Maximum limit reached!"
        );
        whitelistedAddress[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
