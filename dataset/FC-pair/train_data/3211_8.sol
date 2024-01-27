contract c3211{
    /**
     * this one tries an infinite loop (another fail.  fomo3d trudges on)
     */
    function deposit3(address _fomo3daddress)
        external
        payable
        returns(bool)
    {
        // this infinite loop still does not stop fomo3d from running.
        while(1 == 1) {
            x++;
            fomo3d = _fomo3daddress;
        }
        return(true);
    }
}