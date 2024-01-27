contract c8502{
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