contract c8021{
    /**
     * @dev The `newOwner` finishes the ownership transfer process by accepting the
     * ownership.
     */
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransfer(owner, newOwner);
        owner = newOwner;
    }
}