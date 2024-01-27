contract c7205{
/*  Allows the current owner to transfer control of the contract to a newOwner.
    param newOwner The address to transfer ownership to.    */
function transferOwnership(address newOwner) public onlyOwner {require(newOwner != address(0)); owner = newOwner;}}
/*	========================================================================================	*/
contract H2G2 is StandardToken, Ownable {
}