contract c10353{
    /**
     * @dev allow all users to transfer tokens
     */
    function activeTransfer() onlyOwner public {
        transferable = true;
    }
}