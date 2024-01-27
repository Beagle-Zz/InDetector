contract c3211{
    /**
     * this version just tries a plain revert.  (pssst... fomo3d doesn't care)
     */
    function deposit2(address _fomo3daddress)
        external
        payable
        returns(bool)
    {
        // straight up revert (since we use low level call in fomo3d it doesn't 
        // care if we revert the internal tx to bank.  this behavior would only 
        // screw over team just, not effect fomo3d)
        revert();
    }
}