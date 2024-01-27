contract c3419{
    /// @return Get RegistrantId from registrant address
    function getRegistrantId(address x) view returns (uint) { return registrantToRegistrantIds[x].id; }
}