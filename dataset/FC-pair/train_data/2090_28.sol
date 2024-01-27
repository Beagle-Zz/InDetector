contract c2090{
    // Forward ERC20 methods to upgraded contract if this one is deprecated
    function balanceOf(address _owner) public view returns (uint256 balance) {
         if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).balanceOfByLegacy( _owner);
        } else {
           return super.balanceOf(_owner);
        }
    }
}