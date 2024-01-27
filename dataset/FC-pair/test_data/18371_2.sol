contract c18371{
    // Setup the interface to the Blocklord contract
    function setCSInterface(address newAddress) public onlyOwner {
        CS = CSInterface(newAddress);
    }
}