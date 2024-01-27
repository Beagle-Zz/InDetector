contract c18928{
    /// @dev One-way swapFor function, swaps NDC for purchasable token for a given spender
    /// @param _spender account that wants to swap NDC for purchasable token 
    /// @param _rate current NDC to purchasable token rate, i.e. that the returned amount 
    ///              of purchasable tokens equals to (_amount * _rate) / 1000
    /// @param _PTaddress the address of the purchasable token  
    /// @param _amount amount of NDC being offered
    /// @param _expiration expiration timestamp 
    /// @param _v ECDCA signature
    /// @param _r ECDSA signature
    /// @param _s ECDSA signature
    function swapFor(address _spender,
                     uint256 _rate,
                     address _PTaddress,
                     uint256 _amount,
                     uint256 _expiration,
                     uint8 _v,
                     bytes32 _r,
                     bytes32 _s) public {
        // Check if the signature did not expire yet by inspecting the timestamp
        require(_expiration >= block.timestamp);
        // Check if the signature is coming from the neverdie signer address
        address signer = ecrecover(keccak256(_spender, _rate, _PTaddress, _amount, _expiration), _v, _r, _s);
        require(signer == neverdieSigner);
        // Check if the amount of NDC is higher than the minimum amount 
        require(_amount >= minSwapAmount);
        // Check that we hold enough tokens
        HumanStandardToken ptoken = HumanStandardToken(_PTaddress);
        uint256 ptAmount;
        uint8 decimals = ptoken.decimals();
        if (decimals <= 18) {
          ptAmount = SafeMath.div(SafeMath.div(SafeMath.mul(_amount, _rate), 1000), 10**(uint256(18 - decimals)));
        } else {
          ptAmount = SafeMath.div(SafeMath.mul(SafeMath.mul(_amount, _rate), 10**(uint256(decimals - 18))), 1000);
        }
        assert(ndc.transferFrom(_spender, this, _amount) && ptoken.transfer(_spender, ptAmount));
        // Emit Swap event
        Swap(_spender, _PTaddress, _rate, _amount, ptAmount);
    }
}