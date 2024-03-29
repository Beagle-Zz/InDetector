contract c11910{
    /// @dev buy Gold with ether
    /// @param _GoldPrice price in Wei
    /// @param _expiration expiration timestamp
    /// @param _v ECDCA signature
    /// @param _r ECDSA signature
    /// @param _s ECDSA signature
    function buyGold(uint256 _GoldPrice,
                       uint256 _expiration,
                       uint8 _v,
                       bytes32 _r,
                       bytes32 _s
                      ) payable external {
        // Check if the signature did not expire yet by inspecting the timestamp
        require(_expiration >= block.timestamp);
        // Check if the signature is coming from the neverdie address
        address signer = ecrecover(keccak256(_GoldPrice, _expiration), _v, _r, _s);
        require(signer == neverdieSigner);
        require(msg.value >= _GoldPrice);
        assert(ndc.transfer(msg.sender, GOLD_AMOUNT_NDC) 
            && tpt.transfer(msg.sender, GOLD_AMOUNT_TPT)
            && skl.transfer(msg.sender, GOLD_AMOUNT_SKL)
            && xper.transfer(msg.sender, GOLD_AMOUNT_XPER));
        // Emit BuyGold event
        emit BuyGold(msg.sender, _GoldPrice, msg.value);
    }
}