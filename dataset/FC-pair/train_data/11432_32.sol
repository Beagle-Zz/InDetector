contract c11432{
    // from ICOEngineInterface
    function ended() public view returns(bool) {
        return now >= endTime || remainingTokens == 0;
    }
}