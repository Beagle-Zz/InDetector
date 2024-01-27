contract c4901{
    /// Approve some amount of tokens from wallet's account using ERC20 tokens
    ///
    /// @dev Allowed only for rewards
    ///
    /// @param _asset an address of token
    /// @param _to an address of a receiver who is willing to get stored resources
    /// @param _amount an amount of tokens (resources) a receiver wants to get
    ///
    /// @return  code
    function approve(address _asset, address _to, uint256 _amount) public onlyCustomer returns (uint) {
        if (!ERC20Interface(_asset).approve(_to, _amount)) {
            return CUSTOMER_WALLET_NOT_OK;
        }
        return OK;
    }
}