contract c7200{
    /**
    * @dev Allows the owner to change the exchange rate
    * @param _rate The new rate of the crowdsale
    */
    function updateRate(uint256 _rate)
        onlyOwner
        external
    {
        rate = _rate;
    }
}