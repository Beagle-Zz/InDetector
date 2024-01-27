contract c16197{
    /// Returns true if the campaign is in progress.
    function isActive() public constant returns (bool) { return now >= startTime && now < endTime; }
}