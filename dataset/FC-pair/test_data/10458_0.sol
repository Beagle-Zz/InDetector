contract c10458{
    //Contract mutation access modifier
    modifier onlyAdmin{
        require(msg.sender == owner || admins[msg.sender].isAdmin);
        _;
    }
}