contract c10164{
    // set ico dates
    function setDateMainStart(uint _unixts) public onlyOwner checkDateOrder {
        require(now < _unixts && now < dateMainStart);
        dateMainStart = _unixts;
        emit IcoDateUpdated(1, _unixts);
    }
}