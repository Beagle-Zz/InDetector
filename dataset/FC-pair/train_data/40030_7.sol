contract c40030{
     
    function getKudosGiven(address addr) constant returns(uint) {
        UserInfo user = users[addr];
        return user.kudosGiven;
    }
}