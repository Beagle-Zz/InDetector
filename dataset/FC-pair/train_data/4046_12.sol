contract c4046{
    /**
    * @dev Set the address to operator
    * @param _operator has the ability to pause transaction, has the ability to blacklisting & unblacklisting. 
    */
    function setOperator(address _operator) external onlySuperOwner {
        operators[_operator] = true;
        emit TMTG_SetOperator(_operator);
    }
}