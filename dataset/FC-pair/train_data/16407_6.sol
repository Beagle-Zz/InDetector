contract c16407{
    /**
    * @dev Set time until Chibi is considered adult
    * @param _adultTimeSecs Set time in seconds
    */
    function setAdultTime(uint _adultTimeSecs) public contract_onlyOwner returns(bool success) {
        adultTime = _adultTimeSecs;
        return true;
    }
}