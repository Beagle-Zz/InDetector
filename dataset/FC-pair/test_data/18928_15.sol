contract c18928{
    /// @dev One-way swap function, swaps NDC to purchasable tokens
    /// @param _rate current NDC to purchasable token rate, i.e. that the returned amount of purchasable tokens equals to _amount * _rate 
    /// @param _PTaddress the address of the purchasable token  
    /// @param _amount amount of NDC being offered
    /// @param _expiration expiration timestamp 
    /// @param _v ECDCA signature
    /// @param _r ECDSA signature
    /// @param _s ECDSA signature
    function swap(uint256 _rate,
                  address _PTaddress,
                  uint256 _amount,
                  uint256 _expiration,
                  uint8 _v,
                  bytes32 _r,
                  bytes32 _s) external {
        swapFor(msg.sender, _rate, _PTaddress, _amount, _expiration, _v, _r, _s);
    }
}