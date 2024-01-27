contract c2529{
    //gets the user balance, requires that the user be the msg.sender, should make it a bit harder to get users balance
    function userBalance() public view returns(uint) {
        return userBank[msg.sender];
    }
}