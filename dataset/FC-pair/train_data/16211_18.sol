contract c16211{
    /**
     * Functions with this modifier can only be called when the ICO 
     * is not paused.
     * */
    modifier whenNotPaused {
        require(!icoPaused);
        _;
    }
}