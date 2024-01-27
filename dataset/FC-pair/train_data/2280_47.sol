contract c2280{
    /**
    *@dev Returns a tuple of many private variables.
    *The variables from this function are pass through to the TokenLibrary.getVariables function
    *@returns oracle_adress is the address of the oracle
    *@returns duration is the duration of the swap
    *@returns multiplier is the multiplier for the swap
    *@returns token is the address of token
    *@returns _swapFee is the swap fee 
    */
    function getVariables() public view returns (address, uint, uint, address,uint){
        return (oracle_address,duration, multiplier, token,swapFee);
    }
}