contract c7572{
    // enable transfer after token sale and before listing
    function enableTransfer() onlyOwner  public {
        transferable = true;
        EnableTransfer();
    }
}