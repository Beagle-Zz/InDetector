contract c40030{
     
    function getKudosLeft(address addr) constant returns(uint) {
        UserInfo user = users[addr];
        return user.kudosLimit - user.kudosGiven;
    }
}