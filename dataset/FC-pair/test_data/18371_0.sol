contract c18371{
    // Setup the interface to the Blocklord contract
    function setBLInterface(address newAddress) public onlyOwner {
        BL = BLInterface(newAddress);
    }
}