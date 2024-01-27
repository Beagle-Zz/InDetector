contract c12705{
    /**
     * @notice Transfer with addidition data.
     * @param _data will be sent to tokenFallback() if receiver is a contract.
     **/
    function transfer(address _to, uint256 _amount, bytes _data) stopOnPause public returns (bool success){
        if (_transfer(msg.sender, _to, _amount, _data)){
            emit Transfer(msg.sender, _to, _amount, _data);
            return true;
        }
        return false;
    }
}