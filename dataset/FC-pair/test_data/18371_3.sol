contract c18371{
    // Setup the interface to the Bubbled multisig contract
    function setBubbled(address newAddress) public onlyMembers {
        bubbled = newAddress;
    }
}