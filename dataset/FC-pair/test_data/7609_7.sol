contract c7609{
    // set token get rate
    function setBaseTokenGetRate(uint _baseTokenGetRate) public onlyOwner {
        baseTokenGetRate = _baseTokenGetRate;
    }
}