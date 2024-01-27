contract c7205{
/*  Function to check the amount of tokens that an owner allowed to a spender.
    param _owner address The of the funds owner.
    param _spender address The address of the funds spender.
    return A uint256 Specify the amount of tokens still available to the spender.   */
function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {return allowed[_owner][_spender];}}
/*	========================================================================================	*/ 
/*  The Ownable contract has an owner address, and provides basic authorization control
    functions, this simplifies the implementation of "user permissions".    */
contract Ownable {address public owner;
}