contract c18742{
    // false if the ico is not started, false if the ico is started and running, true if the ico is completed
    function ended() public view returns(bool) {
        return hasClosed() || capReached();
    }
}