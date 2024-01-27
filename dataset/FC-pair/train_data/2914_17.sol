contract c2914{
    // @dev Get the current balance of tokens
    // @return uint256 How many tokens there are currently
    function getBalance() public constant returns (uint256) {
        return token.balanceOf(address(this));
    }
}