// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Simple Name Registry (ENS-like): Map an Ethereum address to a human-readable string (name)
 *
 * @notice
 * Project Description:
 * This project implements a simple Ethereum Name Service (ENS)-like smart contract that allows users 
 * to associate their Ethereum addresses with human-readable names. This makes it easier to interact 
 * with blockchain addresses without needing to remember long hexadecimal strings.
 *
 * Project Vision:
 * The vision behind this project is to provide a lightweight and decentralized name registry on Ethereum, 
 * enabling better user experience and easier identification of addresses in the ecosystem. By enabling 
 * address-to-name mapping, we help bridge the gap between blockchain technology and everyday users.
 *
 * Key Features:
 * - Register and update a human-readable name for an Ethereum address
 * - Query the name associated with any Ethereum address
 * - Remove the registered name from the registry
 * - Simple and gas-efficient implementation
 *
 * Future Scope:
 * - Integration with ENS or other decentralized naming protocols
 * - Support for reverse resolution (name to address)
 * - Name expiration and renewal mechanisms
 * - Adding ownership transfer and authorization features for names
 * - Frontend UI for easier interaction with the registry
 */
contract Project {
    // Mapping from Ethereum address to human-readable name
    mapping(address => string) private names;

    // Event emitted when a name is set or updated
    event NameSet(address indexed user, string name);

    // Event emitted when a name is removed
    event NameRemoved(address indexed user);

    /// @notice Set or update the human-readable name for the caller's address
    /// @param name The name to associate with the caller's address
    function setName(string calldata name) external {
        names[msg.sender] = name;
        emit NameSet(msg.sender, name);
    }

    /// @notice Get the name associated with an address
    /// @param user The address to query
    /// @return The name associated with the address, or empty string if none
    function getName(address user) external view returns (string memory) {
        return names[user];
    }

    /// @notice Remove the name associated with the caller's address
    function removeName() external {
        require(bytes(names[msg.sender]).length != 0, "No name to remove");
        delete names[msg.sender];
        emit NameRemoved(msg.sender);
    }
}
