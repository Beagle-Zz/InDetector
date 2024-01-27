contract c18581{
    /// @notice The owner of this contract can change the controller of the token
    ///  Please, be sure that the owner is a trusted agent or 0x0 address.
    /// @param _newController The address of the new controller
    function changeController(address _newController) public onlyOwner {
        token.changeController(_newController);
        ControllerChanged(_newController);
    }
}