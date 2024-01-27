contract c8660{
    /**
    * @dev Allows the owner to remove an existing minter.
    * @param minter The address to remove as a minter.
    */
    function removeMinter(address minter) public onlyOwner {
        require(minter != owner); // cannot remove owner
        require(minters[minter] == true); // already a minter
        emit MinterRemoved(minter);
        delete minters[minter];
    }
}