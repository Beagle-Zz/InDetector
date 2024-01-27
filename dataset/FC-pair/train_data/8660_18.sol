contract c8660{
    /**
    * @dev Allows the owner to add a new minter.
    * @param newMinter The address to add as a minter.
    */
    function addMinter(address newMinter) public onlyOwner {
        require(newMinter != address(0)); // not empty
        require(minters[newMinter] != true); // not already a minter
        emit MinterAdded(newMinter);
        minters[newMinter] = true;
    }
}