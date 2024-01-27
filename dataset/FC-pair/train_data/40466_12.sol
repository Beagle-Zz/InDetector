contract c40466{
     
    modifier noEthSent()
    {
        if (msg.value>0) msg.sender.send(msg.value);
        _;
    }
}