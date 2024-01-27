contract c4868{
    /**
    * @dev Transfer tokens from an account to this contract.
    * @param token Address of token to transfer. 0x0 for ETH
    * @param from Address to send tokens from.
    * @param to Address to send tokens to.
    * @param amount Amount of token to send.
    */
    function transferFrom(
        address token,
        address from,
        address to,
        uint256 amount
    ) 
        internal
        returns (bool)
    {
        require(token == ETH && msg.value == amount || msg.value == 0);
        if (token != ETH) {
            // Remember to approve first
            require(ERC20(token).transferFrom(from, to, amount));
        }
        return true;
    }
}