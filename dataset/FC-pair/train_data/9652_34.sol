contract c9652{
    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function decreaseApproval(address _spender, uint _value) public returns (bool) {
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).decreaseApprovalByLegacy(msg.sender, _spender, _value);
        } else {
            return super.decreaseApproval(_spender, _value);
        } 
   }
}