contract c40106{
     
     
    modifier onlyowner {
        if (isOwner(msg.sender))
            _;
    }
}