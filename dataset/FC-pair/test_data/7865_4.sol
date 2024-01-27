contract c7865{
    //Show date in UNIX time format.
    function showTokensUnfreezeDate(address owner)
    public
    view
    returns(uint)
    {
        //If wallet don't have freezed tokens - function will return 0.
        return wallets[owner].unfreezeDate;
    }
}