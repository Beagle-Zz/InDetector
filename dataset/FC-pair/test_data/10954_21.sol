contract c10954{
    /**
        @dev withdraws tokens held by the controller and sends them to an account
        can only be called by the owner
        @param _token   ERC20 token contract address
        @param _to      account to receive the new amount
        @param _amount  amount to withdraw
    */
    function withdrawFromToken(
        IERC20Token _token, 
        address _to, 
        uint256 _amount
    ) 
        public
        ownerOnly
    {
        ITokenHolder(token).withdrawTokens(_token, _to, _amount);
    }
}