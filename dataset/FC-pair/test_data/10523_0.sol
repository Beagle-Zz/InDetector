contract c10523{
     /*=================================
    =            MODIFIERS            =
    =================================*/
   // Only owner allowed.
    modifier onlyOwner()
    {
        require(msg.sender == owner);
        _;
    }
}