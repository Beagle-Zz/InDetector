contract c10568{
    /*
     *  @dev clean up function to call a self-destruct benefiting the owner
     */
    function cleanUp() onlyOwner public {
        require(finalized);
        selfdestruct(owner);
    }
}