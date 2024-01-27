contract c16844{
    /// @notice its goal is to return the total number of DAppNode packages
    /// @return the total number of DAppNode packages
    function numberOfDAppNodePackages() view public returns (uint) {
        return DAppNodePackages.length;
    }
}