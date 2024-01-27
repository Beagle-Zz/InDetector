contract c7418{
    // setting the admin function of this contract
     modifier onlyAdmin() {
     require(admin[msg.sender]);
    _;
    }
}