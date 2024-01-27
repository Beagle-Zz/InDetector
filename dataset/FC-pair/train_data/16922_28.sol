contract c16922{
    /// @dev Places a bid for breeding. Requires the sender
    /// is the BlockchainCutiesCore contract because all bid methods
    /// should be wrapped. Also returns the cutie to the
    /// seller rather than the winner.
    function bid(uint40 _cutieId) public payable canBeStoredIn128Bits(msg.value) {
        require(msg.sender == address(coreContract));
        address seller = cutieIdToAuction[_cutieId].seller;
        // _bid. is token ID valid?
        _bid(_cutieId, uint128(msg.value));
        // We transfer the cutie back to the seller, the winner will get
        // the offspring
        _transfer(seller, _cutieId);
    }
}