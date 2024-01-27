contract c10492{
    //-------------------------------------------------------------------------- Functions with this modifier can only be executed by the owner
    modifier onlyOwner() 
    {
        if (msg.sender != owner) 
        {
            //----> (Jean) deprecated       throw;
            assert(true==false);
        }
        _;
    }
}