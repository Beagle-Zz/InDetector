contract c4866{
    /// Withdraws some amount of tokens from wallet's account using ERC20 tokens
    ///
    /// @dev Allowed only for rewards
    ///
    /// @param _asset an address of token
    /// @param _to an address of a receiver who is willing to get stored resources
    /// @param _amount an amount of tokens (resources) a receiver wants to get
    ///
    /// @return  code
    function withdraw(address _asset, address _to, uint256 _amount) public onlyCustomer returns (uint) {
        if (!ERC20Interface(_asset).transfer(_to, _amount)) {
            return CUSTOMER_WALLET_NOT_OK;
        }
        return OK;
    }
}