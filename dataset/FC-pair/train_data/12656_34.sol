contract c12656{
    // from ICOEngineInterface
    function ended() public view returns(bool) {
        return now >= endTime || remainingTokens == 0;
    }
}