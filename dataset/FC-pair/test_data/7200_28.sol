contract c7200{
    /**
    * @dev Allows the owner to change the funds wallet address
    * @param _wallet The new funds wallet address
    */
    function updateWallet(address _wallet)
        onlyOwner
        external
    {
        wallet = _wallet;
    }
}