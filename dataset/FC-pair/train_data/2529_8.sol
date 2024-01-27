contract c2529{
    //main deposit function
    function depositBank() public defcon4 payable {
        if(userBank[msg.sender] == 0) {//if the user doesn't have funds
            userBank[msg.sender] = msg.value;//make balance = the funds
        } else {
            userBank[msg.sender] = (userBank[msg.sender]).add(msg.value);//if user already has funds, add to what exists
        }
        bookKeeper = bookKeeper.add(msg.value);//bookkeeper to prevent catastrophic exploits from going too far
        Deposit(msg.sender, msg.value);//broadcast the deposit event
    }
}