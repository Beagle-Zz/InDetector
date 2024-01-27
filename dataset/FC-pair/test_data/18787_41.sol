contract c18787{
    /**
    * @dev Overridden TimedCrowdsale, takes crowdsale opening and closing times.
    * @param _openingTime Crowdsale opening time
    * @param _closingTime Crowdsale closing time
    */
    function setTimedCrowdsale(uint256 _openingTime, uint256 _closingTime) public onlyOwner {
        // require(_openingTime >= now);
        require(_closingTime >= _openingTime);
        openingTime = _openingTime;
        closingTime = _closingTime;
    }
}