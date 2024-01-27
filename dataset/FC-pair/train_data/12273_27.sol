contract c12273{
    /**
     * @dev Returns token balance of the sender.
     */
    function tokenBalance() public view returns(uint256) {
        return token.balanceOf(address(this));
    }
}