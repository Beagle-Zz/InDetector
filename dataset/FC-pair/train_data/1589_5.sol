contract c1589{
    /*
        @dev validates an address - currently only checks that it isn't null
    */
    modifier validAddress(address _address) {
        require(_address != 0x0);
        _;
    }
}