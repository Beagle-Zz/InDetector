contract c16197{
    /// Ensure sender is owner.
    modifier only_owner { require (msg.sender == owner); _; }
}