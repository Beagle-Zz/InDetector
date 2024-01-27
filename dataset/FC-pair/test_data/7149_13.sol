contract c7149{
    //-------------------------------------------------------------------------- Functions with this modifier can only be executed by the owner
    modifier onlyOwnerDuringIco() 
    {
        if (msg.sender!=allowedSender || now > lockedUntil) 
        {
            assert(true==false);
        }
        _;
    }
}