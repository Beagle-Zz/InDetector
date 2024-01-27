contract c12447{
    /**
     * 
     * before controller buy fci for user
     * user nead to place sell order
     */
    function placeSellFciOrder(uint _valueFci) onlyRunning public {
        require(balanceOf[msg.sender] >= _valueFci && _valueFci > 0);
        _transfer(msg.sender, address(this), _valueFci);
        emit PlaceSellFciOrder(msg.sender, _valueFci, now);
    }
}