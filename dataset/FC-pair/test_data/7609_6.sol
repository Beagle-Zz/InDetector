contract c7609{
    //set airDrop flag
    function setAirDrop(bool _airDrop) public onlyOwner {
        airDrop = _airDrop;
    }
}