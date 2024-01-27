contract c8050{
    //for admin user to change present_money
    function setPresentMoney (uint money) public{
        address opt_user=msg.sender;
        if(opt_user == admin_add){
            present_money = money;
        }
    }
}