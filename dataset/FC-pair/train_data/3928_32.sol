contract c3928{
    /**
     * @notice Transfers token ownership to this contract owner
     */
    function claimToken() onlyOwner public {
        token.transferOwnership(owner);
    }
}