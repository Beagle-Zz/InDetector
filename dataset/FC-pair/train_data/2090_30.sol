contract c2090{
    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function allowance(address _owner, address _spender) public view returns (uint256) {
        if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).allowanceByLegacy(_owner, _spender);
        } else {
           return super.allowance(_owner, _spender);
        }
    }
}