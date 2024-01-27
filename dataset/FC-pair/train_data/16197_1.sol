contract c16197{
    /// Ensure sale is not paused.
    modifier when_not_halted { require (!paused); _; }
}