contract c10526{
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