contract c2090{
    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function increaseApproval(address _spender, uint _value) public returns (bool) {
         if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).increaseApprovalByLegacy(msg.sender, _spender, _value);
        } else {
            return super.increaseApproval(_spender, _value);
        } 
    }
}