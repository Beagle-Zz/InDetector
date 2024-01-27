contract c4046{
    /**
    * @dev Remove the address from operator
    * @param _operator has the ability to pause transaction, has the ability to blacklisting & unblacklisting. 
    */
    function delOperator(address _operator) external onlySuperOwner {
        operators[_operator] = false;
        emit TMTG_DeletedOperator(_operator);
    }
}