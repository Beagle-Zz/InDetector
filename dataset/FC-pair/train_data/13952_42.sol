contract c13952{
    /////////////////////////////////////////////////////
    // Expose Settings //////////////////////////////////
    function minBet() public view returns (uint) {
        return settings.minBet;
    }
}