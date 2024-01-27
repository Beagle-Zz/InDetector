contract c2529{
    //widthdraw what is in users bank
    function withdrawBank(uint amount) public defcon2 returns(bool) {
        require(userBank[msg.sender] >= amount);//require that the user has enough to withdraw
        bookKeeper = bookKeeper.sub(amount);//update the bookkeeper
        userBank[msg.sender] = userBank[msg.sender].sub(amount);//reduce users account balance
        Withdraw(msg.sender, amount);//broadcast Withdraw event
        (msg.sender).transfer(amount);//transfer the amount to user
        return true;
    }
}