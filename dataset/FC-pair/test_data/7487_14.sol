contract c7487{
    /// @dev The address assigned the role of `securityGuard` is the only
    ///  addresses that can call a function with this modifier
    modifier onlySecurityGuard { 
        require(msg.sender == securityGuard);
        _;
    }
}