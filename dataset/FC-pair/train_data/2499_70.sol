contract c2499{
    /**
    * @notice Check that Security Token is registered
    * @param _securityToken Address of the Scurity token
    * @return bool
    */
    function isSecurityToken(address _securityToken) public view returns (bool) {
        return (keccak256(bytes(securityTokens[_securityToken].symbol)) != keccak256(""));
    }
}