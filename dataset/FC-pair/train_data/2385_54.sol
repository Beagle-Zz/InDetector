contract c2385{
    /**
     * @notice Update the ETH-to-LPC exchange rate
     * @param _rate The Rate that will applied to ETH to derive how many LPC to mint
     * does not affect, nor influenced by the bonus rates based on the current tier.
     */
    function setRate(uint256 _rate) public onlyOwner {
        require(_rate > 0);
        rate = _rate;
        emit NewRate(rate);
    }
}