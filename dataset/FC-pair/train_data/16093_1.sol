contract c16093{
    // If sealed, transfer is enabled 
    function isSealed()public constant returns (bool) {
        return owner == 0;
    }
}