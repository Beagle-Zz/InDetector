contract c7261{
    //-------------------------------------------------------------------------- Functions with this modifier can only be executed by the owner
    modifier onlyOwner() 
    {
        if (msg.sender != allowedSender) 
        {
            assert(true==false);
        }
        _;
    }
}