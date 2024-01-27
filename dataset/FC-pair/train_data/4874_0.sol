contract c4874{
    /**
    * @dev Transfer tokens from this contract to an account.
    * @param token Address of token to transfer. 0x0 for ETH
    * @param to Address to send tokens to.
    * @param amount Amount of token to send.
    */
    function transfer(address token, address to, uint256 amount) internal returns (bool) {
        if (token == ETH) {
            to.transfer(amount);
        } else {
            require(ERC20(token).transfer(to, amount));
        }
        return true;
    }
}