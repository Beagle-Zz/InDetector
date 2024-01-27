contract c1899{
    // @dev LastSalePrice is updated if seller is the token contract.
    // Otherwise, default bid method is used.
    function bid(uint40 _cutieId)
        public
        payable
        canBeStoredIn128Bits(msg.value)
    {
        // _bid verifies token ID size
        _bid(_cutieId, uint128(msg.value));
        _transfer(msg.sender, _cutieId);
    }
}