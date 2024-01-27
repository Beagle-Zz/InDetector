contract c7418{
    // setting the master function of this contract
     modifier onlyMaster() {
     require(master[msg.sender]);
    _;
    }
}