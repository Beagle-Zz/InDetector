contract c40203{
     
     
    modifier onlyowner() {
        if (isOwner(msg.sender))
            _;
    }
}