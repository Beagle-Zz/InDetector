contract c2874{
    // INTERNAL functions
    function finishICO() private {
        if (m_currentUsdAccepted < c_softCapUsd) {
            changeState(IcoState.FAILED);
        } else {
            changeState(IcoState.SUCCEEDED);
        }
    }
}