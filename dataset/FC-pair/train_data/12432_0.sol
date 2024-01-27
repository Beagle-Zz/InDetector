contract c12432{
    // Prevents user to send transaction on his own address
    modifier notSender(address owner){
        require(msg.sender != owner);
        _;
    }
}