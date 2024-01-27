contract c18193{
    /**
    * @dev Allows the current owner to set the minter contract to a new smart contract.
    * @param newOwner The address to set the minter. Throws an error if the address is an EOA.
    */
    function setMinterContract(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        require(isContract(newOwner));
        emit OwnershipTransferred(ownerContract, newOwner);
        ownerContract = newOwner;
    }
}