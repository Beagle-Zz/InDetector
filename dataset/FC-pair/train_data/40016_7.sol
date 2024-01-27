contract c40016{
     
    function getKudosGiven(address addr) constant returns(uint) {
        UserInfo user = users[addr];
        return user.kudosGiven;
    }
}