contract c40464{
     
    modifier noEthSent()
    {
        if (msg.value>0) msg.sender.send(msg.value);
        _;
    }
}