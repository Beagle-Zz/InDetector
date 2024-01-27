contract c11432{
    // from ICOEngineInterface
    function started() public view returns(bool) {
        return now >= startTime;
    }
}