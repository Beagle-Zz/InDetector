contract c12505{
    /**
     * @dev bind a contract as its owner
     *
     * @param _contract the contract address that will be binded by this Owner Contract
     */
    function bindContract(address _contract) onlyOwner public returns (bool) {
        require(_contract != address(0));
        ownedContract = Claimable(_contract);
        origOwner = ownedContract.owner();
        // take ownership of the owned contract
        ownedContract.claimOwnership();
        return true;
    }
}