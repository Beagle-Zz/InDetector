contract c12325{
    //////////////////////////////////////////////////////buy and sell fci function//////////////////////////////////////////////////////////
    /**
    *  Setup pause phrase
    */
    function changePause() public onlyController {
        isPause = !isPause;
    }
}