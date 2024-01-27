contract c16424{
    /// This modifier will be used to disable all ERC20 functionalities during the minting process.
    modifier whenNotMinting() {
        require(mintingFinished);
        _;
    }
}