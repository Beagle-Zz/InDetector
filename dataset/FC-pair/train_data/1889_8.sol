contract c1889{
    //event Log
    modifier onlyVendor() {
        require(vendors[msg.sender] == true);
        _;
    }
}