contract c13401{
    /// @notice Transfer tokens from caller to another address
    /// @param _to address The address which you want to transfer to
    /// @param _value uint256 the amout of tokens to be transfered
    function transfer(address _to, uint256 _value) public transferable returns (bool) {
        return super.transfer(_to, _value);
    }
}