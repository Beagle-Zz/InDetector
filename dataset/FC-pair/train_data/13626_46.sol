contract c13626{
    /**
        @dev returns the expected return for selling the token for one of its connector tokens
        @param _connectorToken  connector token contract address
        @param _sellAmount      amount to sell (in the smart token)
        @return expected sale return amount
    */
    function getSaleReturn(IERC20Token _connectorToken, uint256 _sellAmount) public view returns (uint256) {
        return getSaleReturn(_connectorToken, _sellAmount, token.totalSupply());
    }
}