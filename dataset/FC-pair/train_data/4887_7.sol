contract c4887{
    /// Deposits some amount of tokens on wallet's account using ERC20 tokens
    ///
    /// @dev Allowed only for rewards
    ///
    /// @param _asset an address of token
    /// @param _from an address of a sender who is willing to transfer her resources
    /// @param _amount an amount of tokens (resources) a sender wants to transfer
    ///
    /// @return code
    function deposit(address _asset, address _from, uint256 _amount) public onlyCustomer returns (uint) {
        if (!ERC20Interface(_asset).transferFrom(_from, this, _amount)) {
            return CUSTOMER_WALLET_NOT_OK;
        }
        return OK;
    }
}