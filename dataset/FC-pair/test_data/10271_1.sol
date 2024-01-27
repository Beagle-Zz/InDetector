contract c10271{
    /// @notice This function will set the conversion rate.
    /// @dev To set a rate of 100 token / eth, you would make the rate 100 hopefully.
    /// @param _rateMe The conversion rate in a hole
    function setRate(uint _rateMe) public ownerOnly {
        rateMe = _rateMe;
    }
}