contract c4046{
    /**
    * @dev Block trading. Only owner and operator are available.
    */
    function pause() onlyOwnerOrOperator whenNotPaused public {
        paused = true;
        emit TMTG_Pause();
    }
}