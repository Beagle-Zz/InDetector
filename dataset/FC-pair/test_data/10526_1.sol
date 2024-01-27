contract c10526{
   // The tokens can never be stolen.
    modifier notBIT(address aContract)
    {
        require(aContract != address(BITcontract));
        _;
    } 
}