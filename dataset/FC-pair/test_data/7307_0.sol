contract c7307{
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