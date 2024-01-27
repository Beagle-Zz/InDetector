contract c12630{
    //view balance
    function queryBalance(address add) public view returns(uint){
        return contract_users[add];
    }
}