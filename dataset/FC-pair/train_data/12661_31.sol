contract c12661{
    // This function created for easier testing purposes
    function createJaroSleep(address _token, uint256 _dailyTime) internal returns (JaroSleep) {
        return new JaroSleep(_token, _dailyTime);
    }
}