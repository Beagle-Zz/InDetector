contract c18089{
    /**
     * @dev Add wallet to privileged list. For contract owner only.
     */
    function addToPrivilegedList(address _wallet) public onlyOwner {
        privilegedList[_wallet] = true;
    }
}