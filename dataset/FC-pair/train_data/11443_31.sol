contract c11443{
    // from ICOEngineInterface
    function started() public view returns(bool) {
        return now >= startTime;
    }
}