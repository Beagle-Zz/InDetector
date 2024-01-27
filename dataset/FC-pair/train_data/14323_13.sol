contract c14323{
    /// @dev buy TPT with ether
    /// @param _TPTprice TPT price in Wei
    /// @param _expiration expiration timestamp
    /// @param _v ECDCA signature
    /// @param _r ECDSA signature
    /// @param _s ECDSA signature
    function buyTPT(uint256 _TPTprice,
                    uint256 _expiration,
                    uint8 _v,
                    bytes32 _r,
                    bytes32 _s
                   ) payable external {
        // Check if the signature did not expire yet by inspecting the timestamp
        require(_expiration >= block.timestamp);
        // Check if the signature is coming from the neverdie address
        address signer = ecrecover(keccak256(_TPTprice, _expiration), _v, _r, _s);
        require(signer == neverdieSigner);
        uint256 a = SafeMath.div(SafeMath.mul(msg.value, 10**18), _TPTprice);
        assert(tpt.transfer(msg.sender, a));
        // Emit BuyNDC event
        BuyTPT(msg.sender, _TPTprice, msg.value, a);
    }
}