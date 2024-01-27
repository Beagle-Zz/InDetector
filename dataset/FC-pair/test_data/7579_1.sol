contract c7579{
    /**
    * @dev Function to Selfdestruct contruct.
    */
    function burnMe () {
        // Selfdestruct and send eth to self, 
        selfdestruct(address(this));
    }
}