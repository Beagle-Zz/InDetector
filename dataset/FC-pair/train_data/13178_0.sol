contract c13178{
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