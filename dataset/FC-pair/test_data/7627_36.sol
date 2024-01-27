contract c7627{
    /**
        @dev Deprecates the engine, locks the creation of new loans.
    */
    function setDeprecated(bool _deprecated) public onlyOwner {
        deprecated = _deprecated;
    }
}