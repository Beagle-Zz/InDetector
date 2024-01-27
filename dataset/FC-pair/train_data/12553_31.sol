contract c12553{
    // from ICOEngineInterface
    function ended() public view returns(bool) {
        return now >= endTime || remainingTokens == 0;
    }
}