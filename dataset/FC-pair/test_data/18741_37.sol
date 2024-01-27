contract c18741{
    // false if the ico is not started, true if the ico is started and running, true if the ico is completed
    function started() public view returns(bool) {
        return now >= openingTime;
    }
}