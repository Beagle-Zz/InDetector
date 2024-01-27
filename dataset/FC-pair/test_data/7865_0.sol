contract c7865{
    // Prevents user to send transaction on his own address
    modifier notSender(address owner)
    {
        require(msg.sender != owner);
        _;
    }
}