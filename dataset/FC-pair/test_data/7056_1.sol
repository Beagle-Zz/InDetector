contract c7056{
    // Only marked 'done' if CALL succeeds (not exceptional condition).
    function cast() public note {
        require( !done );
        exec(whom, data, mana);
        done = true;
    }
}