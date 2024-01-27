contract c18834{
    /**
     * @dev change the owner of the contract from this contract address to another one.
     *
     * @param _nextOwner the contract address that will be next Owner of the original Contract
     */
    function changeOwnershipto(address _nextOwner)  onlyOwner public {
        ownedContract.transferOwnership(_nextOwner);
        ownedContract = Claimable(address(0));
        origOwner = address(0);
    }
}