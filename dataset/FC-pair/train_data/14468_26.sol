contract c14468{
    /**
     * @dev Agent sign on user data
     */
    function _signPropertyByAgent(address _agent, address _user, bytes32 _property) internal {
        bytes32 _hash = _getHash(_user, _property);
        agentSign[_agent][_hash] = true;
    }
}