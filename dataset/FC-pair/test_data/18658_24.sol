contract c18658{
    // Change the duration for new auctions
    function setDuration(uint _duration) external onlyAuthority {
        duration = _duration;
    }
}