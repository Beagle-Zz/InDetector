contract c18911{
    /**
     * Owner can update base information here.
     */
    function setCoinInfo(address coin) public {
        require(msg.sender == ceoAddress || msg.sender == cooAddress);
		coinContract = ERC223(coin);
        emit EvtCoinSetted(coinContract);
    }
}