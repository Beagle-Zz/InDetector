contract c8502{
   // The tokens can never be stolen.
    modifier notPooh(address aContract)
    {
        require(aContract != address(poohContract));
        _;
    } 
}