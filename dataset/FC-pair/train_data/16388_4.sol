contract c16388{
    /// @dev Reclaim all ERC20Basic compatible tokens
    /// @param _address The address of the token contract
    function recoverToken(address _address) external ifAuthorized(msg.sender, APHRODITE) {
        require(_address != address(0));
        IERC20Basic token = IERC20Basic(_address);
        uint256 balance = token.balanceOf(address(this));
        token.transfer(msg.sender, balance);
    }
}