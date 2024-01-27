contract c11437{
    // from ICOEngineInterface
    function started() public view returns(bool) {
        return now >= startTime;
    }
}