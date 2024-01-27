contract c8050{
    //admin account transfer money to users
    function adminSendMoneyToUser(address to,uint256 value) public{
        address opt_add=msg.sender;
        if(opt_add == admin_add){
            transferFrom(admin_add,to,value);
        }
    }
}