contract c40341{
     
    function withdrawFunds() {
        externalEnter();
        withdrawFundsRP();
        externalLeave();
    }
}