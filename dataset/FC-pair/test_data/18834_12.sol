contract c18834{
    /**
     * @dev change the owner of the contract from this contract address to the original one.
     *
     */
    function transferOwnershipBack() onlyOwner public {
        ownedContract.transferOwnership(origOwner);
        ownedContract = Claimable(address(0));
        origOwner = address(0);
    }
}