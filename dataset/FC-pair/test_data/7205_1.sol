contract c7205{
/*	========================================================================================	*/ 
/* Gets the balance of the specified address.
   param _owner The address to query the the balance of. 
   return An uint256 representing the amount owned by the passed address.
*/
function balanceOf(address _owner) public constant returns (uint256 balance) {return balances[_owner];}}
/*	========================================================================================	*/ 
/*  Implementation of the basic standard token. https://github.com/ethereum/EIPs/issues/20 */
contract StandardToken is ERC20, BasicToken {mapping (address => mapping (address => uint256)) allowed;
}