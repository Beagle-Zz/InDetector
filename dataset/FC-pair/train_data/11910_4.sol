contract c11910{
    /// @dev buy Silver with ether
    /// @param _SilverPrice price in Wei
    /// @param _expiration expiration timestamp
    /// @param _v ECDCA signature
    /// @param _r ECDSA signature
    /// @param _s ECDSA signature
    function buySilver(uint256 _SilverPrice,
                       uint256 _expiration,
                       uint8 _v,
                       bytes32 _r,
                       bytes32 _s
                      ) payable external {
        // Check if the signature did not expire yet by inspecting the timestamp
        require(_expiration >= block.timestamp);
        // Check if the signature is coming from the neverdie address
        address signer = ecrecover(keccak256(_SilverPrice, _expiration), _v, _r, _s);
        require(signer == neverdieSigner);
        require(msg.value >= _SilverPrice);
        assert(ndc.transfer(msg.sender, SILVER_AMOUNT_NDC) 
            && tpt.transfer(msg.sender, SILVER_AMOUNT_TPT)
            && skl.transfer(msg.sender, SILVER_AMOUNT_SKL)
            && xper.transfer(msg.sender, SILVER_AMOUNT_XPER));
        // Emit BuySilver event
        emit BuySilver(msg.sender, _SilverPrice, msg.value);
    }
}