contract c12553{
    // from ICOEngineInterface
    function started() public view returns(bool) {
        return now >= startTime;
    }
}