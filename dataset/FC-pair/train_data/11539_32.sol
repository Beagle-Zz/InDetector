contract c11539{
    /// @notice Transfer tokens from one address to another
    /// @param _from address The address from which you want to transfer
    /// @param _to address The address which you want to transfer to
    /// @param _value uint256 the amout of tokens to be transfered
    function transferFrom(address _from, address _to, uint256 _value) public transferable returns (bool) {        
        return super.transferFrom(_from, _to, _value);
    }
}