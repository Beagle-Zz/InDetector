contract c4980{
    /* Get Address Contracts */
    function getContracts(address owner) returns (string) {
        return mapOwnerStringContract[owner];
    }
}