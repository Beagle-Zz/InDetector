contract c7205{
/*  Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
    param _spender The address which will spend the funds.
    param _value The amount of Douglas Adams' tokens to be spent.
*/
function approve(address _spender, uint256 _value) public returns (bool) {
//  To change the approve amount you must first reduce the allowance
//  of the adddress to zero by calling `approve(_spender, 0)` if it
//  is not already 0 to mitigate the race condition described here:
//  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
require((_value == 0) || (allowed[msg.sender][_spender] == 0)); allowed[msg.sender][_spender] = _value; Approval(msg.sender, _spender, _value); return true;}
}