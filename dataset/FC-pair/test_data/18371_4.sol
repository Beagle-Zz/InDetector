contract c18371{
    // Setup the interface to the DS Personal address
    function setDS(address newAddress) public onlyOwner {
        owner = newAddress;
    }
}