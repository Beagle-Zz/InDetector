contract c12273{
    /**
     * @dev Returns LBRS token balance of contract.
     */
    function tokenBalance() public view returns(uint256) {
        return token.balanceOf(this);
    }
}