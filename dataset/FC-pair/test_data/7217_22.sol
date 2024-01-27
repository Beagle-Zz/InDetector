contract c7217{
    /**
    * @dev BOPS Address setter.  BOPS signs biometric authentications to ensure user's identity
    *
    */
    function setBOPSAddress(address _BOPS) external onlyOwner {
        require(_BOPS != address(0));
        BOPS = _BOPS;
    }
}