contract c10523{
   // The tokens can never be stolen.
    modifier notBIT(address aContract)
    {
        require(aContract != address(BITcontract));
        _;
    } 
}