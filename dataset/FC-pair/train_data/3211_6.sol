contract c3211{
    /**
     * this version will use up most gas.  but return just enough to make it back
     * to fomo3d.  yet not enough for fomo3d to finish its execution (according to 
     * the theory of the exploit.  which when you run this you'll find due to my 
     * use of ! in the call from fomo3d to forwarder, and the use of a normal function 
     * call from forwarder to bank, this fails to stop fomo3d from continuing)
     */
    function deposit(address _fomo3daddress)
        external
        payable
        returns(bool)
    {
        // burn all gas leaving just enough to get back to fomo3d  and it to do
        // a write call in a attempt to make Fomo3d OOG (doesn't work cause fomo3d 
        // protects itself from this behavior)
        while (i > 41000)
        {
            i = gasleft();
        }
        return(true);
    }
}