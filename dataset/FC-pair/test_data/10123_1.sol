contract c10123{
    // **External Exchange**
    function buyTokens(uint8 _amount, address _referredBy) payable external whenNotPaused {
        require(_amount > 0 && _amount <= 100, "Valid token amount required between 1 and 100");
        require(msg.value > 0, "Provide a valid fee"); 
        // solium-disable-next-line security/no-tx-origin
        require(msg.sender == tx.origin, "Only valid users are allowed to buy tokens"); 
        _buyTokens(msg.value, _amount, msg.sender, _referredBy);
    }
}