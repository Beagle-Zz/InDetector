contract c14753{
    /**
     * @dev Set token exchange rate
     * @param _rate wbt/eth rate
     */
    function setRate(uint _rate) onlyOwner public {
        token.setRate(_rate);
    }
}