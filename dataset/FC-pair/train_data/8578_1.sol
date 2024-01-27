contract c8578{
    /**
     * @dev Throws if called by any account other than the all owners in the history of
     * the smart contract.
     */
    modifier onlyAnyOwners() {
        require(allOwnersMap[msg.sender] == 1, "You're not the owner or never were the owner!");
        _;
    }
}