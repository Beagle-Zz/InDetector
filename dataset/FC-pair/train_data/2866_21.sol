contract c2866{
    // @dev bid on auction. Complete it and transfer ownership of cutie if enough ether was given.
    function bid(uint40 _cutieId) public payable whenNotPaused canBeStoredIn128Bits(msg.value)
    {
        // _bid throws if something failed.
        _bid(_cutieId, uint128(msg.value));
        _transfer(msg.sender, _cutieId);
    }
}