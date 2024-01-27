contract c3702{
    /**
    * @dev Unlock limit for trading. Owner and operator are available and this function can be operated in paused mode.
    */
    function unpause() onlyOwnerOrOperator whenPaused public {
        paused = false;
        emit TMTG_Unpause();
    }
}